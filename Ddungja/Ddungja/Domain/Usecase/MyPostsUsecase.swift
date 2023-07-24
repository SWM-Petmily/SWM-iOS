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
    func getApplyList(id: Int,  _ page: Int) -> AnyPublisher<ApplyListVO, MoyaError>
    func getDetailApply(id: Int) -> AnyPublisher<DetailApplyVO, MoyaError>
    func postAcceptInfo(id: Int, approval: String) -> AnyPublisher<AcceptInfoResponseVO, MoyaError>
}

final class MyPostsUsecase: MyPostsUsecaseInterface {
    let repository: MyPostsRepositoryInterface

    init(repository: MyPostsRepositoryInterface) {
        self.repository = repository
    }
    
    func getMyEditPosts(_ status: String, _ page: Int) -> AnyPublisher<MyEditPostsVO, MoyaError> {
        return repository.getMyEditPosts(status, page)
    }
    
    func getApplyList(id: Int,  _ page: Int) -> AnyPublisher<ApplyListVO, MoyaError> {
        return repository.getApplyList(id: id, page)
    }
    
    func getDetailApply(id: Int) -> AnyPublisher<DetailApplyVO, MoyaError> {
        return repository.getDetailApply(id: id)
    }
    
    func postAcceptInfo(id: Int, approval: String) -> AnyPublisher<AcceptInfoResponseVO, MoyaError> {
        return repository.postAcceptInfo(id: id, approval: approval)
    }
}
