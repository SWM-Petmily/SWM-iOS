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
    func getMyEditPosts(_ status: String, _ page: Int) -> AnyPublisher<MyEditPostsDTO, MoyaError>
    func getMyApplyPosts(_ status: String, _ page: Int) -> AnyPublisher<MyApplyPostsDTO, MoyaError>
    func getApplyList(id: Int, _ page: Int) -> AnyPublisher<ApplyListDTO, MoyaError>
    func getDetailApply(id: Int) -> AnyPublisher<DetailApplyDTO, MoyaError>
    func postAcceptInfo(id: Int, approval: String) -> AnyPublisher<AcceptInfoResponseDTO, MoyaError>
    func deleteInfo(id: Int) -> AnyPublisher<DeleteInfoDTO, MoyaError>
}


final class MyPostsAPIProvider: MyPostsDataSourceInterface {
    let moyaProvider: MoyaProvider<MyPostsAPI>
    var cancellabe = Set<AnyCancellable>()
    
    init(moyaProvider: MoyaProvider<MyPostsAPI> = .init()) {
        self.moyaProvider = moyaProvider
    }
    
    func getMyEditPosts(_ status: String, _ page: Int) -> AnyPublisher<MyEditPostsDTO, MoyaError> {
        return moyaProvider.requestPublisher(.myEditPosts(status: status, page: page))
            .retry(3)
            .eraseToAnyPublisher()
            .map(MyEditPostsDTO.self)
    }
    
    func getMyApplyPosts(_ status: String, _ page: Int) -> AnyPublisher<MyApplyPostsDTO, MoyaError> {
        return moyaProvider.requestPublisher(.myApplyPosts(status: status, page: page))
            .retry(3)
            .eraseToAnyPublisher()
            .map(MyApplyPostsDTO.self)
    }
    
    func getApplyList(id: Int, _ page: Int) -> AnyPublisher<ApplyListDTO, MoyaError> {
        return moyaProvider.requestPublisher(.applyList(id: id, page))
            .retry(3)
            .eraseToAnyPublisher()
            .map(ApplyListDTO.self)
    }
    
    func getDetailApply(id: Int) -> AnyPublisher<DetailApplyDTO, MoyaError> {
        return moyaProvider.requestPublisher(.detailApply(id: id))
            .retry(3)
            .eraseToAnyPublisher()
            .map(DetailApplyDTO.self)
    }
    
    func postAcceptInfo(id: Int, approval: String) -> AnyPublisher<AcceptInfoResponseDTO, MoyaError> {
        let approval = AccpetInfoVO(approval: approval).toAccpetInfoDTO()
        return moyaProvider.requestPublisher(.acceptInfo(id: id, approval: approval))
            .retry(3)
            .eraseToAnyPublisher()
            .map(AcceptInfoResponseDTO.self)
    }
    
    func deleteInfo(id: Int) -> AnyPublisher<DeleteInfoDTO, MoyaError> {
        return moyaProvider.requestPublisher(.deleteInfo(id: id))
            .retry(3)
            .eraseToAnyPublisher()
            .map(DeleteInfoDTO.self)
    }
}
