//
//  MyPostsUsecase.swift
//  Ddungja
//
//  Created by 오승기 on 2023/07/15.
//

import Combine

protocol MyPostsUsecaseInterface {
    func getMyEditPosts(_ status: String, _ page: Int) -> AnyPublisher<MyEditPostsVO, CustomErrorVO>
    func getApplyList(id: Int,  _ page: Int) -> AnyPublisher<ApplyListVO, CustomErrorVO>
    func getDetailApply(id: Int) -> AnyPublisher<DetailApplyVO, CustomErrorVO>
    func postAcceptInfo(id: Int, approval: String) -> AnyPublisher<AcceptInfoResponseVO, CustomErrorVO>
}

final class MyPostsUsecase: MyPostsUsecaseInterface {
    let repository: MyPostsRepositoryInterface

    init(repository: MyPostsRepositoryInterface) {
        self.repository = repository
    }
    
    func getMyEditPosts(_ status: String, _ page: Int) -> AnyPublisher<MyEditPostsVO, CustomErrorVO> {
        return repository.getMyEditPosts(status, page)
    }
    
    func getApplyList(id: Int,  _ page: Int) -> AnyPublisher<ApplyListVO, CustomErrorVO> {
        return repository.getApplyList(id: id, page)
    }
    
    func getDetailApply(id: Int) -> AnyPublisher<DetailApplyVO, CustomErrorVO> {
        return repository.getDetailApply(id: id)
    }
    
    func postAcceptInfo(id: Int, approval: String) -> AnyPublisher<AcceptInfoResponseVO, CustomErrorVO> {
        return repository.postAcceptInfo(id: id, approval: approval)
    }
}
