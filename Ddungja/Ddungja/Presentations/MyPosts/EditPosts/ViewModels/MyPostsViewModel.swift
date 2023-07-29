//
//  MyPostsViewModel.swift
//  Ddungja
//
//  Created by 오승기 on 2023/07/15.
//

import Foundation
import Combine
import SwiftUI

final class MyPostsViewModel: ObservableObject {
    private var coordinator: CoordinatorProtocol
    private let myPostsUsecase: MyPostsUsecaseInterface
    private var cancellables = Set<AnyCancellable>()
    
    @Published var myEditPosts = [EditPostsInfoVO]()
    @Published var applyLists = [ApplyListInfoVO]()
    @Published var detailApply: DetailApplyVO
    @Published var pageInfo = 0
    @Published var totalPage = 0
    @Published var status = "SAVE"
    @State private var isLoading = false
    
    private var isRequest = false
    
    var fetchMoreActionSubject = PassthroughSubject<(), Never>()
    var touchEvent = PassthroughSubject<(id: Int, approval: String), Never>()
    
    init(coordinator: CoordinatorProtocol, myPostsUsecase: MyPostsUsecaseInterface) {
        self.coordinator = coordinator
        self.myPostsUsecase = myPostsUsecase
        self.detailApply = DetailApplyVO(applyId: -1, nickname: "뚱자쓰", job: "-",environment: "-",people: 0,comment: "",region: "",isExperience: false,url: "", openTalk: "",approval: "",applyExperiences: [],isMyApply: false)
    
        touchEvent
            .throttle(for: 3, scheduler: RunLoop.main, latest: false)
            .sink{ [weak self] (id, approve) in
                guard let self = self else { return }

                if(!isRequest) {
                    self.isRequest = true
                    self.tapAcceptOrReject(id: id, approval: approve)
                }
            }
            .store(in: &cancellables)
        
        fetchMoreActionSubject.sink{ [weak self] _ in
            guard let self = self else { return }
            if !self.isLoading {
                self.fetchMoreMyEditPosts()
            }
        }
        .store(in: &cancellables)
    }
    
    func getMyEditPosts(_ status: String, _ page: Int = 1) {
        myPostsUsecase.getMyEditPosts(status, page)
            .sink { completion in
                print("getMyEditPosts \(completion)")
            } receiveValue: { [weak self] vo in
                self?.myEditPosts = vo.content
                self?.pageInfo = vo.pageable.pageNumber + 1
                self?.totalPage = vo.totalPage
            }
            .store(in: &cancellables)
    }
    
    func fetchMoreMyEditPosts() {
        if(pageInfo == totalPage) { return }
        let next = pageInfo + 1
        myPostsUsecase.getMyEditPosts(status, next)
            .sink { completion in
                print("fetchMoreMyEditPosts \(completion)")
                self.isLoading = false
            } receiveValue: { [weak self] vo in
                self?.myEditPosts += vo.content
                self?.pageInfo = vo.pageable.pageNumber + 1
                self?.totalPage = vo.totalPage
            }
            .store(in: &cancellables)
    }
    
    func getApplyList(id: Int, _ page: Int = 1) {
        myPostsUsecase.getApplyList(id: id, page)
            .sink { completion in
                print("getApplyList \(completion)")
            } receiveValue: { [weak self] vo in
                self?.applyLists += vo.content
                self?.pageInfo = vo.pageable.pageNumber + 1
                self?.totalPage = vo.totalPages
            }
            .store(in: &cancellables)
    }
    
    func fetchMoreApplyList(id: Int) {
        if(pageInfo == totalPage) { return }
        let next = pageInfo + 1
        myPostsUsecase.getApplyList(id: id, next)
            .sink { completion in
                print("fetchMoreApplyList \(completion)")
                self.isLoading = false
            } receiveValue: { [weak self] vo in
                self?.applyLists += vo.content
                self?.pageInfo = vo.pageable.pageNumber + 1
                self?.totalPage = vo.totalPages
            }
            .store(in: &cancellables)
    }
    
    func getDetailApply(id: Int) {
        myPostsUsecase.getDetailApply(id: id)
            .sink { completion in
                print("getDetailApply \(completion)")
            } receiveValue: { [weak self] vo in
                self?.detailApply = vo
            }
            .store(in: &cancellables)
    }
    
    /*
     - VO를 통해 지원 받은 목록 셀을 처리해주어야함.
     - UI를 어떻게할지 아직 정해지지 않음
     */
    func tapAcceptOrReject(id: Int, approval: String) {
        myPostsUsecase.postAcceptInfo(id: id, approval: approval)
            .sink { [weak self] completion in
                print("tapAcceptOrReject \(completion)")
                self?.isRequest = false
            } receiveValue: { [weak self] vo in
                self?.pop()
            }
            .store(in: &cancellables)

    }
    
    func moveToApplyList(id :Int) {
        coordinator.push(.applyList(id: id))
    }
    
    func moveToDetaionApply(id: Int) {
        coordinator.push(.detailApply(id: id))
    }
    
    func pop() {
        coordinator.pop()
    }
}