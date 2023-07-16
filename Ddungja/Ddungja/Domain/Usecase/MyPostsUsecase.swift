//
//  MyPostsUsecase.swift
//  Ddungja
//
//  Created by 오승기 on 2023/07/15.
//

import Foundation

protocol MyPostsUsecaseInterface {
    func getMyEditPosts(_ status: String, _ page: Int)
}
final class MyPostsUsecase: MyPostsUsecaseInterface {
    let repository: MyPostsRepositoryInterface

    init(repository: MyPostsRepositoryInterface) {
        self.repository = repository
    }
    
    func getMyEditPosts(_ status: String, _ page: Int) {
        return repository.getMyEditPosts(status, page)
    }
}
