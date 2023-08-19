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
    func getMyEditPosts(_ status: String, _ page: Int) -> AnyPublisher<MyEditPostsDTO, CustomErrorVO>
    func getMyApplyPosts(_ status: String, _ page: Int) -> AnyPublisher<MyApplyPostsDTO, CustomErrorVO>
    func getApplyList(id: Int, _ page: Int) -> AnyPublisher<ApplyListDTO, CustomErrorVO>
    func getDetailApply(id: Int) -> AnyPublisher<DetailApplyDTO, CustomErrorVO>
    func postAcceptInfo(id: Int, approval: String) -> AnyPublisher<AcceptInfoResponseDTO, CustomErrorVO>
    func deleteInfo(id: Int) -> AnyPublisher<DeleteInfoDTO, CustomErrorVO>
    func postApply(_ postId: Int, _ info: ApplyDTO) -> AnyPublisher<PostApplyDTO, CustomErrorVO>
}


final class MyPostsAPIProvider: MyPostsDataSourceInterface {
    private let moyaProvider: MoyaProvider<MyPostsAPI>
    
    init(moyaProvider: MoyaProvider<MyPostsAPI> = .init()) {
        self.moyaProvider = moyaProvider
    }
    
    func getMyEditPosts(_ status: String, _ page: Int) -> AnyPublisher<MyEditPostsDTO, CustomErrorVO> {
        return moyaProvider.requestPublisher(.myEditPosts(status: status, page: page))
            .asResult()
    }
    
    func getMyApplyPosts(_ status: String, _ page: Int) -> AnyPublisher<MyApplyPostsDTO, CustomErrorVO> {
        return moyaProvider.requestPublisher(.myApplyPosts(status: status, page: page))
            .asResult()
    }
    
    func getApplyList(id: Int, _ page: Int) -> AnyPublisher<ApplyListDTO, CustomErrorVO> {
        return moyaProvider.requestPublisher(.applyList(id: id, page))
            .asResult()
    }
    
    func getDetailApply(id: Int) -> AnyPublisher<DetailApplyDTO, CustomErrorVO> {
        return moyaProvider.requestPublisher(.detailApply(id: id))
            .asResult()
    }
    
    func postAcceptInfo(id: Int, approval: String) -> AnyPublisher<AcceptInfoResponseDTO, CustomErrorVO> {
        let approval = AccpetInfoVO(approval: approval).toAccpetInfoDTO()
        return moyaProvider.requestPublisher(.acceptInfo(id: id, approval: approval))
            .asResult()
    }
    
    func deleteInfo(id: Int) -> AnyPublisher<DeleteInfoDTO, CustomErrorVO> {
        return moyaProvider.requestPublisher(.deleteInfo(id: id))
            .asResult()
    }
    
    func postApply(_ postId: Int, _ info: ApplyDTO) -> AnyPublisher<PostApplyDTO, CustomErrorVO> {
        return moyaProvider.requestPublisher(.postApply(postId: postId, info: info))
            .asResult()
    }
}
