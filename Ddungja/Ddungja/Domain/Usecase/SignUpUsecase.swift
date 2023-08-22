//
//  SignUpUsecase.swift
//  Ddungja
//
//  Created by 오승기 on 2023/07/29.
//

import Combine
import Moya

protocol SignUpUsecaseInterface {
    func requestCertification(about phoneNumber: String) -> AnyPublisher<Void, CustomErrorVO>
    func checkCertification(_ certication: String) -> AnyPublisher<Void, CustomErrorVO>
    func registerUserInfo(_ nickname: String) -> AnyPublisher<Void, CustomErrorVO> 
}

final class SignUpUsecase: SignUpUsecaseInterface {
    private let repository: SignUpRepository
    
    init(repository: SignUpRepository) {
        self.repository = repository
    }
    
    func requestCertification(about phoneNumber: String) -> AnyPublisher<Void, CustomErrorVO> {
        return repository.requestCertification(about: phoneNumber)
    }
    
    func checkCertification(_ certication: String) -> AnyPublisher<Void, CustomErrorVO> {
        return repository.checkCertification(certication)
    }
    
    func registerUserInfo(_ nickname: String) -> AnyPublisher<Void, CustomErrorVO> {
        return repository.registerUserInfo(nickname)
    }
}

