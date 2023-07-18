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
}
