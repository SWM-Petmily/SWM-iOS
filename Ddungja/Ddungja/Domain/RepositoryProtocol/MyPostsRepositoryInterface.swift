//
//  MyPostsRepositoryInterface.swift
//  Ddungja
//
//  Created by 오승기 on 2023/07/15.
//

import Combine

protocol MyPostsRepositoryInterface {
    func getMyEditPosts(_ status: String, _ page: Int) -> AnyPublisher<MyEditPostsVO, CustomErrorVO>
    func getMyApplyPosts(_ status: String, _ page: Int) -> AnyPublisher<MyApplyPostsVO, CustomErrorVO>
    func getApplyList(id: Int, _ page: Int) -> AnyPublisher<ApplyListVO, CustomErrorVO>
    func getDetailApply(id: Int) -> AnyPublisher<DetailApplyVO, CustomErrorVO>
    func postAcceptInfo(id: Int, approval: String) -> AnyPublisher<AcceptInfoResponseVO, CustomErrorVO>
    func deleteInfo(id: Int) -> AnyPublisher<ApplyIDInfoVO, CustomErrorVO>
    func postApply(_ postId: Int, _ info: DetailApplyVO) -> AnyPublisher<ApplyIDInfoVO, CustomErrorVO>
}
