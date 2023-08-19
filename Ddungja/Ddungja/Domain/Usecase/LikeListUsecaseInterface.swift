//
//  LikeListUsecase.swift
//  Ddungja
//
//  Created by 오승기 on 2023/08/18.
//

import Foundation
import Combine

protocol LikeListUsecaseInterface {
    func getLikeList(_ status: String, _ page: Int) -> AnyPublisher<LikeListVO, CustomErrorVO>
}

final class LikeListUsecase: LikeListUsecaseInterface {
    private let repository: LikeListRepositoryInterface
    
    init(repository: LikeListRepositoryInterface) {
        self.repository = repository
    }
    
    func getLikeList(_ status: String, _ page: Int) -> AnyPublisher<LikeListVO, CustomErrorVO> {
        return repository.getLikeList(status, page)
    }
}
