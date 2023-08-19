//
//  LikeListAPIProvider.swift
//  Ddungja
//
//  Created by 오승기 on 2023/08/18.
//

import Foundation
import CombineMoya
import Moya
import Combine


protocol LikeListDataSourceInterface {
    func getLikeList(_ status: String, _ page: Int) -> AnyPublisher<LikeListDTO, CustomErrorVO>
}

final class LikeListAPIProvider: LikeListDataSourceInterface {
    private let moyaProvider: MoyaProvider<LikeListAPI>
    
    init(moyaProvider: MoyaProvider<LikeListAPI> = .init()) {
        self.moyaProvider = moyaProvider
    }
    
    func getLikeList(_ status: String, _ page: Int) -> AnyPublisher<LikeListDTO, CustomErrorVO> {
        moyaProvider.requestPublisher(.getLikeList(status: status, page: page))
            .asResult()
    }
}
