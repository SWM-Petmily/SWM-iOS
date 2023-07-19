//
//  MyApplyPostsViewModel.swift
//  Ddungja
//
//  Created by 오승기 on 2023/07/18.
//

import Combine

final class MyApplyPostsViewModel: ObservableObject {
    private var coordinator: CoordinatorProtocol
    private let myPostsUsecase: MyApplyPostsUsecaseInterface
    private var cancellables = Set<AnyCancellable>()
    
    init(coordinator: CoordinatorProtocol, myPostsUsecase: MyApplyPostsUsecaseInterface) {
        self.coordinator = coordinator
        self.myPostsUsecase = myPostsUsecase
        
        getMyApplyPosts("APPROVED")
    }
    
    func getMyApplyPosts(_ status: String, _ page: Int = 1) {
        myPostsUsecase.getMyApplyPosts(status, page)
            .sink { error in
                print(error)
            } receiveValue: { vo in
                print(vo.content)
            }
            .store(in: &cancellables)
    }
    
    func pop() {
        coordinator.pop()
    }
}
