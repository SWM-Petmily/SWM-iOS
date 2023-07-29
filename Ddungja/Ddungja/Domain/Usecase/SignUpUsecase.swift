//
//  SignUpUsecase.swift
//  Ddungja
//
//  Created by 오승기 on 2023/07/29.
//

import Combine
import Moya

protocol SignUpUsecaseInterface {
    func requestCertification(about phoneNumber: String) -> AnyPublisher<CertificationNumberVO, MoyaError>
    func checkCertification(_ id: Int,_ phone: String,_ certication: String) -> AnyPublisher<Int, MoyaError>
}

final class SignUpUsecase: SignUpUsecaseInterface {
    private let repository: SignUpRepository
    
    init(repository: SignUpRepository) {
        self.repository = repository
    }
    
    func requestCertification(about phoneNumber: String) -> AnyPublisher<CertificationNumberVO, MoyaError> {
        repository.requestCertification(about: phoneNumber)
    }
    
    func checkCertification(_ id: Int,_ phone: String,_ certication: String) -> AnyPublisher<Int, MoyaError> {
        return repository.checkCertification(id, phone, certication)
    }
}

