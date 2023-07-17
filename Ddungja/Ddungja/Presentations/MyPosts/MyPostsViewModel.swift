//
//  MyPostsViewModel.swift
//  Ddungja
//
//  Created by 오승기 on 2023/07/15.
//

import Foundation
import Combine

final class MyPostsViewModel: ObservableObject {
    private var coordinator: CoordinatorProtocol
    private let myPostsUsecase: MyPostsUsecaseInterface
    private var cancellables = Set<AnyCancellable>()
    
    @Published var myEditPosts = [PostsInfoVO]()
    @Published var pageInfo = 0
    @Published var status = "ALL"
    @Published var isLoading = false
    
    var refreshActionSubject = PassthroughSubject<(), Never>()
    var fetchMoreActionSubject = PassthroughSubject<(), Never>()
    
    init(coordinator: CoordinatorProtocol, myPostsUsecase: MyPostsUsecaseInterface) {
        self.coordinator = coordinator
        self.myPostsUsecase = myPostsUsecase
        
        refreshActionSubject.sink{ [weak self] _ in
            guard let self = self else { return }
            self.getMyEditPosts()
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
    
    func getMyEditPosts(_ status: String = "SAVE", _ page: Int = 1) {
        myPostsUsecase.getMyEditPosts(status, page)
            .sink { error in
                print(error)
            } receiveValue: { vo in
                self.myEditPosts = vo.content
                print(self.myEditPosts)
            }
            .store(in: &cancellables)
    }
    
    func fetchMoreMyEditPosts() {
        self.isLoading = true
        let pageToLoad = pageInfo + 1
        myPostsUsecase.getMyEditPosts(status, pageToLoad)
            .sink { completion in
                print(completion)
                self.isLoading = false
            } receiveValue: { vo in
                self.myEditPosts += vo.content
                self.pageInfo = vo.pageable.pageNumber
            }
            .store(in: &cancellables)

    }
    
    func pop() {
        coordinator.pop()
    }
}
