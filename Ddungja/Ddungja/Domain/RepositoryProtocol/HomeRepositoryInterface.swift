//
//  HomeRepository.swift
//  Ddungja
//
//  Created by 오승기 on 2023/08/01.
//

import Combine
import Moya

protocol HomeRepositoryInterface {
    func getMainPost(_ page: Int) -> AnyPublisher<HomeVO, MoyaError>
    func requestChangeDisLike(_ id: Int) -> AnyPublisher<Int, MoyaError> 
    func requestChangeLike(_ id: Int) -> AnyPublisher<Int, MoyaError>
}
