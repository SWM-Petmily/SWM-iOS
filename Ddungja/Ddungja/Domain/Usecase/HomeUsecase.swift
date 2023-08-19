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
    func getMainPost(_ page: Int) -> AnyPublisher<HomeVO, CustomErrorVO>
    func tappedLike(_ id: Int, _ currentCheck: Bool) -> AnyPublisher<Int, MoyaError>
    func getDetailPost(_ id: Int) -> AnyPublisher<DetailPostVO, CustomErrorVO>
}

final class HomeUsecase: HomeUsecaseInterface {
    private let repository: HomeRepositoryInterface
    
    init(repository: HomeRepositoryInterface) {
        self.repository = repository
    }
    
    func getMainPost(_ page: Int) -> AnyPublisher<HomeVO, CustomErrorVO> {
        return repository.getMainPost(page)
    }

    /*
     - currentCheck가 true일 경우 좋아요 취소 요청
     - currentCheck가 false일 경우 좋아요 누르기 요청
     */
    func tappedLike(_ id: Int, _ currentCheck: Bool) -> AnyPublisher<Int, MoyaError> {
        if currentCheck {
            return repository.requestChangeDisLike(id)
        } else {
            return repository.requestChangeLike(id)
        }
    }
    
    func getDetailPost(_ id: Int) -> AnyPublisher<DetailPostVO, CustomErrorVO> {
        return repository.getDetailPost(id)
    }
}
