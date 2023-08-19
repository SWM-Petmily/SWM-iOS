//
//  LikeListRepositoryInterface.swift
//  Ddungja
//
//  Created by 오승기 on 2023/08/18.
//

import Foundation
import Combine

protocol LikeListRepositoryInterface {
    func getLikeList(_ status: String, _ page: Int) -> AnyPublisher<LikeListVO, CustomErrorVO>
}
