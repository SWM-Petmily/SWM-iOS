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
    
    var fetchMoreActionSubject = PassthroughSubject<(), Never>()
    
    init(coordinator: CoordinatorProtocol, myPostsUsecase: MyApplyPostsUsecaseInterface) {
        self.coordinator = coordinator
        self.myPostsUsecase = myPostsUsecase
        
        fetchMoreActionSubject.sink{ [weak self] _ in
            guard let self = self else { return }
            if !self.isLoading {
                self.fetchMoreMyApplyPosts()
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
        let next = pageInfo
        myPostsUsecase.getMyApplyPosts(status, next)
            .sink { completion in
                print(completion)
                self.isLoading = false
            } receiveValue: { [weak self] vo in
                self?.myApplyPosts += vo.content
                self?.pageInfo = vo.pageable.pageNumber
                self?.totalPage = vo.totalPage
            }
            .store(in: &cancellables)
    }
    
    func pop() {
        coordinator.pop()
    }
}
