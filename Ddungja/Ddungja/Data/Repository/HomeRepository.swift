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
    
    func getMainPost(_ page: Int) -> AnyPublisher<HomeVO, CustomErrorVO> {
        return datasource.getMainPost(page)
            .map { $0.toHomeVO() }
            .eraseToAnyPublisher()
    }
    
    func requestChangeDisLike(_ id: Int) -> AnyPublisher<Int, MoyaError>  {
        return datasource.requestChangeDislike(id)
            .map { $0.statusCode }
            .eraseToAnyPublisher()
    }
    
    func requestChangeLike(_ id: Int) -> AnyPublisher<Int, MoyaError> {
        return datasource.requestChangeLike(id)
            .map { $0.statusCode }
            .eraseToAnyPublisher()
    }
    
    func getDetailPost(_ id: Int) -> AnyPublisher<DetailPostVO, CustomErrorVO> {
        datasource.getDetailPost(id)
            .map { $0.toDetailPostVO() }
            .eraseToAnyPublisher()
    }
}
