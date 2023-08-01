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
    func getMainPost()
}

final class HomeAPIProvider: HomeDataSourceInterface {
    private let moyaProvider: MoyaProvider<HomeAPI>
    
    init(moyaProvider: MoyaProvider<HomeAPI>) {
        self.moyaProvider = moyaProvider
    }
    
    func getMainPost() {
        moyaProvider.requestPublisher(.mainPost)
            .retry(3)
            .eraseToAnyPublisher()
    }
}
