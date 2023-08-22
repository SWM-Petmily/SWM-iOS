//
//  SignUpRepository.swift
//  Ddungja
//
//  Created by 오승기 on 2023/06/23.
//

import Combine

protocol SignUpRepository {
    func requestCertification(about: String) -> AnyPublisher<Void, CustomErrorVO>
    func checkCertification(_ certication: String) -> AnyPublisher<Void, CustomErrorVO>
    func registerUserInfo(_ nickname: String) -> AnyPublisher<Void, CustomErrorVO>
}
