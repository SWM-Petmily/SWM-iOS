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
    func getApplyInfo(id: Int) -> AnyPublisher<DetailApplyVO, MoyaError>
    func deleteInfo(id: Int) -> AnyPublisher<ApplyIDInfoVO, MoyaError>
    func postApply(_ postId: Int, _ info: DetailApplyVO) -> AnyPublisher<ApplyIDInfoVO, MoyaError>
}

final class MyApplyPostsUsecase: MyApplyPostsUsecaseInterface {
    let repository: MyPostsRepositoryInterface
    
    init(repository: MyPostsRepositoryInterface) {
        self.repository = repository
    }
    
    func getMyApplyPosts(_ status: String, _ page: Int) -> AnyPublisher<MyApplyPostsVO, MoyaError> {
        return repository.getMyApplyPosts(status, page)
    }
    
    func getApplyInfo(id: Int) -> AnyPublisher<DetailApplyVO, MoyaError> {
        return repository.getDetailApply(id: id)
    }
    
    func deleteInfo(id: Int) -> AnyPublisher<ApplyIDInfoVO, MoyaError> {
        return repository.deleteInfo(id: id)
    }
    
    func postApply(_ postId: Int, _ info: DetailApplyVO) -> AnyPublisher<ApplyIDInfoVO, MoyaError> {
        return repository.postApply(postId, info)
    }
}
