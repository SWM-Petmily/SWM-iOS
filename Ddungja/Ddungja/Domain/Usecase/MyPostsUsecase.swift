//
//  MyPostsUsecase.swift
//  Ddungja
//
//  Created by 오승기 on 2023/07/15.
//

import Combine
import Moya

protocol MyPostsUsecaseInterface {
    func getMyEditPosts(_ status: String, _ page: Int) -> AnyPublisher<MyEditPostsVO, MoyaError>
    func getApplyList(id: Int)
}

final class MyPostsUsecase: MyPostsUsecaseInterface {
    let repository: MyPostsRepositoryInterface

    init(repository: MyPostsRepositoryInterface) {
        self.repository = repository
    }
    
    func getMyEditPosts(_ status: String, _ page: Int) -> AnyPublisher<MyEditPostsVO, MoyaError> {
        return repository.getMyEditPosts(status, page)
    }
    
    func getApplyList(id: Int) {
        repository.getApplyList(id: id)
    }
}
