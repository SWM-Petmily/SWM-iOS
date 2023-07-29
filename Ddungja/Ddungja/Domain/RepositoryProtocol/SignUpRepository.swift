//
//  SignUpRepository.swift
//  Ddungja
//
//  Created by 오승기 on 2023/06/23.
//

import Combine
import Moya

protocol SignUpRepository {
    func requestCertification(about: String) -> AnyPublisher<CertificationNumberVO, MoyaError>
    func checkCertification(_ id: Int,_ phone: String,_ certication: String) -> AnyPublisher<Int, MoyaError>
    func registerUserInfo(_ id: Int, _ nickname: String, _ phoneNumber: String) -> AnyPublisher<Int, MoyaError>
}
