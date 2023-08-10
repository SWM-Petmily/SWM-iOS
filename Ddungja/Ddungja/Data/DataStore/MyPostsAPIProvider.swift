//
//  MyPostsAPIProvider.swift
//  Ddungja
//
//  Created by 오승기 on 2023/07/15.
//

import Foundation
import Moya
import CombineMoya
import Combine

protocol MyPostsDataSourceInterface {
    func getMyEditPosts(_ status: String, _ page: Int) -> AnyPublisher<MyEditPostsDTO, Error>
    func getMyApplyPosts(_ status: String, _ page: Int) -> AnyPublisher<MyApplyPostsDTO, Error>
    func getApplyList(id: Int, _ page: Int) -> AnyPublisher<ApplyListDTO, Error>
    func getDetailApply(id: Int) -> AnyPublisher<DetailApplyDTO, Error>
    func postAcceptInfo(id: Int, approval: String) -> AnyPublisher<AcceptInfoResponseDTO, Error>
    func deleteInfo(id: Int) -> AnyPublisher<DeleteInfoDTO, Error>
    func postApply(_ postId: Int, _ info: DetailApplyVO) -> AnyPublisher<PostApplyDTO, Error>
}


final class MyPostsAPIProvider: MyPostsDataSourceInterface {
    let moyaProvider: MoyaProvider<MyPostsAPI>
    
    init(moyaProvider: MoyaProvider<MyPostsAPI> = .init()) {
        self.moyaProvider = moyaProvider
    }
    
    func getMyEditPosts(_ status: String, _ page: Int) -> AnyPublisher<MyEditPostsDTO, Error> {
        return moyaProvider.requestPublisher(.myEditPosts(status: status, page: page))
            .asResult()
    }
    
    func getMyApplyPosts(_ status: String, _ page: Int) -> AnyPublisher<MyApplyPostsDTO, Error> {
        return moyaProvider.requestPublisher(.myApplyPosts(status: status, page: page))
            .asResult()
    }
    
    func getApplyList(id: Int, _ page: Int) -> AnyPublisher<ApplyListDTO, Error> {
        return moyaProvider.requestPublisher(.applyList(id: id, page))
            .asResult()
    }
    
    func getDetailApply(id: Int) -> AnyPublisher<DetailApplyDTO, Error> {
        return moyaProvider.requestPublisher(.detailApply(id: id))
            .asResult()
    }
    
    func postAcceptInfo(id: Int, approval: String) -> AnyPublisher<AcceptInfoResponseDTO, Error> {
        let approval = AccpetInfoVO(approval: approval).toAccpetInfoDTO()
        return moyaProvider.requestPublisher(.acceptInfo(id: id, approval: approval))
            .asResult()
    }
    
    func deleteInfo(id: Int) -> AnyPublisher<DeleteInfoDTO, Error> {
        return moyaProvider.requestPublisher(.deleteInfo(id: id))
            .asResult()
    }
    
    func postApply(_ postId: Int, _ info: DetailApplyVO) -> AnyPublisher<PostApplyDTO, Error> {
        return moyaProvider.requestPublisher(.postApply(postId: postId, info: info))
            .asResult()
    }
}
