//
//  HomeAPIProvider.swift
//  Ddungja
//
//  Created by 오승기 on 2023/08/01.
//

import Moya
import CombineMoya
import Combine

protocol HomeDataSourceInterface {
    func getMainPost(_ page: Int) -> AnyPublisher<HomeDTO, MoyaError>
}

final class HomeAPIProvider: HomeDataSourceInterface {
    private let moyaProvider: MoyaProvider<HomeAPI>
    
    init(moyaProvider: MoyaProvider<HomeAPI> = .init()) {
        self.moyaProvider = moyaProvider
    }
    
    func getMainPost(_ page: Int) -> AnyPublisher<HomeDTO, MoyaError> {
        return moyaProvider.requestPublisher(.mainPost(page: page))
            .retry(3)
            .eraseToAnyPublisher()
            .map(HomeDTO.self)
    }
}
