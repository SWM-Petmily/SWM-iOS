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
    @Published var pageInfo = 0
    @Published var totalPage = 0
    @Published var status = "SAVE"
    @State private var isLoading = false
    
    var fetchMoreActionSubject = PassthroughSubject<(), Never>()
    
    init(coordinator: CoordinatorProtocol, myPostsUsecase: MyPostsUsecaseInterface) {
        self.coordinator = coordinator
        self.myPostsUsecase = myPostsUsecase
        
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
            .sink { error in
                print(error)
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
                print(completion)
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
                print(completion)
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
                print(completion)
                self.isLoading = false
            } receiveValue: { [weak self] vo in
                self?.applyLists += vo.content
                self?.pageInfo = vo.pageable.pageNumber + 1
                self?.totalPage = vo.totalPages
            }
            .store(in: &cancellables)
    }
    
    func moveToApplyList(id :Int) {
        coordinator.push(.applyList(id: id))
    }
    
    func moveToDetaionApply(id: Int) {
        coordinator.push(<#T##page: Page##Page#>)
    }
    
    func pop() {
        coordinator.pop()
    }
}
