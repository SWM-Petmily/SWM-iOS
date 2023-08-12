//
//  MyPostsRepository.swift
//  Ddungja
//
//  Created by 오승기 on 2023/07/15.
//

import Combine

final class MyPostsRepository: MyPostsRepositoryInterface {
    let dataSource: MyPostsDataSourceInterface
    
    init(dataSource: MyPostsDataSourceInterface) {
        self.dataSource = dataSource
    }
    
    func getMyEditPosts(_ status: String, _ page: Int) -> AnyPublisher<MyEditPostsVO, CustomErrorVO> {
        return dataSource.getMyEditPosts(status, page)
            .map { $0.toEditPostsVO() }
            .eraseToAnyPublisher()
    }
    
    func getMyApplyPosts(_ status: String, _ page: Int) -> AnyPublisher<MyApplyPostsVO, CustomErrorVO> {
        return dataSource.getMyApplyPosts(status, page)
            .map { $0.toApplyPostsVO() }
            .eraseToAnyPublisher()
    }
    
    func getApplyList(id: Int, _ page: Int) -> AnyPublisher<ApplyListVO, CustomErrorVO> {
       return dataSource.getApplyList(id: id, page)
            .map { $0.toApplyListVO() }
            .eraseToAnyPublisher()
    }
    
    func getDetailApply(id: Int) -> AnyPublisher<DetailApplyVO, CustomErrorVO> {
        return dataSource.getDetailApply(id: id)
            .map { $0.toDetailApplyVO() }
            .eraseToAnyPublisher()
    }
    func postAcceptInfo(id: Int, approval: String) -> AnyPublisher<AcceptInfoResponseVO, CustomErrorVO> {
        return dataSource.postAcceptInfo(id: id, approval: approval)
            .map { $0.toAcceptInfoResponseVO() }
            .eraseToAnyPublisher()
    }
    
    func deleteInfo(id: Int) -> AnyPublisher<ApplyIDInfoVO, CustomErrorVO> {
        dataSource.deleteInfo(id: id)
            .map { $0.toInfoVO() }
            .eraseToAnyPublisher()
    }
    
    func postApply(_ postId: Int, _ info: DetailApplyVO) -> AnyPublisher<ApplyIDInfoVO, CustomErrorVO> {
        return dataSource.postApply(postId, info)
            .map { $0.toApplyIdVO() }
            .eraseToAnyPublisher()
    }
}
