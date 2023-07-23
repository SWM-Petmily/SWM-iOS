//
//  MyPostsRepositoryInterface.swift
//  Ddungja
//
//  Created by 오승기 on 2023/07/15.
//

import Moya
import Combine

protocol MyPostsRepositoryInterface {
    func getMyEditPosts(_ status: String, _ page: Int) -> AnyPublisher<MyEditPostsVO, MoyaError>
    func getMyApplyPosts(_ status: String, _ page: Int) -> AnyPublisher<MyApplyPostsVO, MoyaError>
    func getApplyList(id: Int, _ page: Int) -> AnyPublisher<ApplyListVO, MoyaError>
    func getDetailApply(id: Int) -> AnyPublisher<DetailApplyVO, MoyaError>
    func postAcceptInfo(id: Int, approval: String) -> AnyPublisher<AcceptInfoResponseVO, MoyaError>
}
