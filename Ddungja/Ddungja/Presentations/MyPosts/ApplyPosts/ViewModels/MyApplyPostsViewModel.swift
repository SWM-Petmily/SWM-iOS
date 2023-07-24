//
//  MyApplyPostsViewModel.swift
//  Ddungja
//
//  Created by 오승기 on 2023/07/18.
//

import Combine
import SwiftUI

final class MyApplyPostsViewModel: ObservableObject {
    private var coordinator: CoordinatorProtocol
    private let myPostsUsecase: MyApplyPostsUsecaseInterface
    private var cancellables = Set<AnyCancellable>()
    @State private var isLoading = false
    
    @Published var pageInfo = 0
    @Published var totalPage = 0
    @Published var status = ""
    @Published var myApplyPosts = [ApplyPostsInfoVO]()
    @Published var detailApply: DetailApplyVO
    
    private var isRequest = false
    
    var deleteEvent = PassthroughSubject<Int, Never>()
    
    init(coordinator: CoordinatorProtocol, myPostsUsecase: MyApplyPostsUsecaseInterface) {
        self.coordinator = coordinator
        self.myPostsUsecase = myPostsUsecase
        self.detailApply = DetailApplyVO(applyId: -1, nickname: "뚱자쓰", job: "-",environment: "-",people: 0,comment: "",region: "",isExperience: false,url: "", openTalk: "",approval: "",applyExperiences: [],isMyApply: false)
        
        deleteEvent
            .throttle(for: 3, scheduler: RunLoop.main, latest: false)
            .sink{ [weak self] id in
                guard let self = self else { return }

                if(!isRequest) {
                    self.isRequest = true
                    self.deletInfo(id: id)
                }
            }
            .store(in: &cancellables)
    }
    
    func getMyApplyPosts(_ status: String, _ page: Int = 1) {
        myPostsUsecase.getMyApplyPosts(status, page)
            .sink { error in
                print(error)
            } receiveValue: { [weak self] vo in
                self?.myApplyPosts = vo.content
                self?.pageInfo = vo.pageable.pageNumber + 1
                self?.totalPage = vo.totalPage
            }
            .store(in: &cancellables)
    }
    
    func fetchMoreMyApplyPosts() {
        if(pageInfo == totalPage) { return }
        let next = pageInfo + 1
        myPostsUsecase.getMyApplyPosts(status, next)
            .sink { completion in
                print(completion)
                self.isLoading = false
            } receiveValue: { [weak self] vo in
                self?.myApplyPosts += vo.content
                self?.pageInfo = vo.pageable.pageNumber + 1
                self?.totalPage = vo.totalPage
            }
            .store(in: &cancellables)
    }
    
    func getApplyInfo(id: Int) {
        myPostsUsecase.getApplyInfo(id: id)
            .sink { completion in
                print("getApplyInfo \(completion)")
            } receiveValue: { [weak self] vo in
                self?.detailApply = vo
            }
            .store(in: &cancellables)
    }
    
    func deletInfo(id: Int) {
        myPostsUsecase.deleteInfo(id: id)
            .sink { [weak self] completion in
                print("tapAcceptOrReject \(completion)")
                self?.isRequest = false
            } receiveValue: { [weak self] vo in
                self?.pop()
                print(vo)
            }
            .store(in: &cancellables)
    }
    
    func moveToApplyModifyView(_ id: Int) {
        coordinator.push(.applyModify(id: id))
    }
    
    func pop() {
        coordinator.pop()
    }
}
