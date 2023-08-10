//
//  MyApplyPostsUsecase.swift
//  Ddungja
//
//  Created by 오승기 on 2023/07/18.
//

import Combine

protocol MyApplyPostsUsecaseInterface {
    func getMyApplyPosts(_ status: String, _ page: Int) -> AnyPublisher<MyApplyPostsVO, Error>
    func getApplyInfo(id: Int) -> AnyPublisher<DetailApplyVO, Error>
    func deleteInfo(id: Int) -> AnyPublisher<ApplyIDInfoVO, Error>
    func postApply(_ postId: Int, _ info: DetailApplyVO) -> AnyPublisher<ApplyIDInfoVO, Error>
}

final class MyApplyPostsUsecase: MyApplyPostsUsecaseInterface {
    let repository: MyPostsRepositoryInterface
    
    init(repository: MyPostsRepositoryInterface) {
        self.repository = repository
    }
    
    func getMyApplyPosts(_ status: String, _ page: Int) -> AnyPublisher<MyApplyPostsVO, Error> {
        return repository.getMyApplyPosts(status, page)
    }
    
    func getApplyInfo(id: Int) -> AnyPublisher<DetailApplyVO, Error> {
        return repository.getDetailApply(id: id)
    }
    
    func deleteInfo(id: Int) -> AnyPublisher<ApplyIDInfoVO, Error> {
        return repository.deleteInfo(id: id)
    }
    
    func postApply(_ postId: Int, _ info: DetailApplyVO) -> AnyPublisher<ApplyIDInfoVO, Error> {
        return repository.postApply(postId, info)
    }
}
