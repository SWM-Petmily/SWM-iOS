//
//  LikeListRepository.swift
//  Ddungja
//
//  Created by 오승기 on 2023/08/18.
//

import Foundation
import Combine
 
final class LikeListRepository: LikeListRepositoryInterface {
    private let datasource: LikeListDataSourceInterface
    
    init(datasource: LikeListDataSourceInterface) {
        self.datasource = datasource
    }
    
    func getLikeList(_ status: String, _ page: Int) -> AnyPublisher<LikeListVO, CustomErrorVO> {
        return datasource.getLikeList(status, page)
            .map { $0.toLikeListVO() }
            .eraseToAnyPublisher()
    }
}
