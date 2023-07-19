//
//  MyApplyPostsUsecase.swift
//  Ddungja
//
//  Created by 오승기 on 2023/07/18.
//

import Combine
import Moya

protocol MyApplyPostsUsecaseInterface {
    func getMyApplyPosts(_ status: String, _ page: Int) -> AnyPublisher<MyApplyPostsVO, MoyaError>
}

final class MyApplyPostsUsecase: MyApplyPostsUsecaseInterface {
    let repository: MyPostsRepositoryInterface
    
    init(repository: MyPostsRepositoryInterface) {
        self.repository = repository
    }
    
    func getMyApplyPosts(_ status: String, _ page: Int) -> AnyPublisher<MyApplyPostsVO, MoyaError> {
        return repository.getMyApplyPosts(status, page)
    }
}
