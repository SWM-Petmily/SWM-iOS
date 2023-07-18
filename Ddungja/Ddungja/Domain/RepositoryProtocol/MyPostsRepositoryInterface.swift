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
}