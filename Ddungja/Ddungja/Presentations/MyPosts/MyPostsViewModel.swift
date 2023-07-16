//
//  MyPostsViewModel.swift
//  Ddungja
//
//  Created by 오승기 on 2023/07/15.
//

import Foundation

final class MyPostsViewModel: ObservableObject {
    private var coordinator: CoordinatorProtocol
    private let myPostsUsecase: MyPostsUsecaseInterface
    
    init(coordinator: CoordinatorProtocol, myPostsUsecase: MyPostsUsecaseInterface) {
        self.coordinator = coordinator
        self.myPostsUsecase = myPostsUsecase
    func getMyEditPosts(_ status: String, _ page: Int) {
        myPostsUsecase.getMyEditPosts(status, page)
    }
    
    func pop() {
        coordinator.pop()
    }
}
