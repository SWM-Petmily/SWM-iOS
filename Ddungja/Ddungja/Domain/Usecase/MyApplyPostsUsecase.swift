//
//  MyApplyPostsUsecase.swift
//  Ddungja
//
//  Created by 오승기 on 2023/07/18.
//

import Combine

protocol MyApplyPostsUsecaseInterface {
    func getMyApplyPosts(_ status: String, _ page: Int) -> AnyPublisher<MyApplyPostsVO, CustomErrorVO>
    func getApplyInfo(id: Int) -> AnyPublisher<DetailApplyVO, CustomErrorVO>
    func deleteInfo(id: Int) -> AnyPublisher<ApplyIDInfoVO, CustomErrorVO>
    func postApply(_ postId: Int, _ info: DetailApplyVO) -> AnyPublisher<ApplyIDInfoVO, CustomErrorVO>
}

final class MyApplyPostsUsecase: MyApplyPostsUsecaseInterface {
    let repository: MyPostsRepositoryInterface
    
    init(repository: MyPostsRepositoryInterface) {
        self.repository = repository
    }
    
    func getMyApplyPosts(_ status: String, _ page: Int) -> AnyPublisher<MyApplyPostsVO, CustomErrorVO> {
        return repository.getMyApplyPosts(status, page)
    }
    
    func getApplyInfo(id: Int) -> AnyPublisher<DetailApplyVO, CustomErrorVO> {
        return repository.getDetailApply(id: id)
    }
    
    func deleteInfo(id: Int) -> AnyPublisher<ApplyIDInfoVO, CustomErrorVO> {
        return repository.deleteInfo(id: id)
    }
    
    func postApply(_ postId: Int, _ info: DetailApplyVO) -> AnyPublisher<ApplyIDInfoVO, CustomErrorVO> {
        return repository.postApply(postId, info)
    }
}
