//
//  HomeRepository.swift
//  Ddungja
//
//  Created by 오승기 on 2023/08/01.
//

import Combine
import Moya

final class HomeRepository: HomeRepositoryInterface {
    private let datasource: HomeDataSourceInterface
    
    init(datasource: HomeDataSourceInterface) {
        self.datasource = datasource
    }
    
    func getMainPost(_ page: Int) -> AnyPublisher<HomeVO, MoyaError> {
        return datasource.getMainPost(page)
            .map { $0.toHomeVO() }
            .eraseToAnyPublisher()
    }
}
