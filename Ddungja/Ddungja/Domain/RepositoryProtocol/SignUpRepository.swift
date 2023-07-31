//
//  SignUpRepository.swift
//  Ddungja
//
//  Created by 오승기 on 2023/06/23.
//

import Combine
import Moya

protocol SignUpRepository {
    func requestCertification(about: String) -> AnyPublisher<Int, MoyaError>
    func checkCertification(_ certication: String) -> AnyPublisher<Int, MoyaError>
    func registerUserInfo(_ nickname: String) -> AnyPublisher<Int, MoyaError>
}
