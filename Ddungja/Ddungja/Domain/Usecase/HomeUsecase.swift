//
//  HomeUsecase.swift
//  Ddungja
//
//  Created by 오승기 on 2023/08/01.
//

import Foundation
import Combine
import Moya

protocol HomeUsecaseInterface {
    func getMainPost(_ page: Int) -> AnyPublisher<HomeVO, MoyaError>
}

final class HomeUsecase: HomeUsecaseInterface {
    private let repository: HomeRepositoryInterface
    
    init(repository: HomeRepositoryInterface) {
        self.repository = repository
    }
    
    func getMainPost(_ page: Int) -> AnyPublisher<HomeVO, MoyaError> {
        return repository.getMainPost(page)
    }
}
