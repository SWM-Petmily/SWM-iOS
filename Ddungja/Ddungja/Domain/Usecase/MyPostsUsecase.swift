//
//  MyPostsUsecase.swift
//  Ddungja
//
//  Created by 오승기 on 2023/07/15.
//

import Combine

protocol MyPostsUsecaseInterface {
    func getMyEditPosts(_ status: String, _ page: Int) -> AnyPublisher<MyEditPostsVO, Error>
    func getApplyList(id: Int,  _ page: Int) -> AnyPublisher<ApplyListVO, Error>
    func getDetailApply(id: Int) -> AnyPublisher<DetailApplyVO, Error>
    func postAcceptInfo(id: Int, approval: String) -> AnyPublisher<AcceptInfoResponseVO, Error>
}

final class MyPostsUsecase: MyPostsUsecaseInterface {
    let repository: MyPostsRepositoryInterface

    init(repository: MyPostsRepositoryInterface) {
        self.repository = repository
    }
    
    func getMyEditPosts(_ status: String, _ page: Int) -> AnyPublisher<MyEditPostsVO, Error> {
        return repository.getMyEditPosts(status, page)
    }
    
    func getApplyList(id: Int,  _ page: Int) -> AnyPublisher<ApplyListVO, Error> {
        return repository.getApplyList(id: id, page)
    }
    
    func getDetailApply(id: Int) -> AnyPublisher<DetailApplyVO, Error> {
        return repository.getDetailApply(id: id)
    }
    
    func postAcceptInfo(id: Int, approval: String) -> AnyPublisher<AcceptInfoResponseVO, Error> {
        return repository.postAcceptInfo(id: id, approval: approval)
    }
}
