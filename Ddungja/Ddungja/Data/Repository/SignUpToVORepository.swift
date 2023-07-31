//
//  SignUpToVORepository.swift
//  Ddungja
//
//  Created by 오승기 on 2023/06/23.
//

import Combine
import Moya

final class SignUpToVORepository: SignUpRepository {
    
    private let dataSource: SignUpDataSourceInterface
    
    init(dataSource: SignUpDataSourceInterface) {
        self.dataSource = dataSource
    }
    
    func requestCertification(about phoneNumber: String) -> AnyPublisher<Int, MoyaError> {
        return dataSource.requestCertification(about: phoneNumber)
            .map { $0.statusCode }
            .eraseToAnyPublisher()
    }
    
    func checkCertification(_ certication: String) -> AnyPublisher<Int, MoyaError> {
        return dataSource.checkCertification(certication)
            .map { $0.statusCode }
            .eraseToAnyPublisher()
    }
    
    func registerUserInfo(_ nickname: String) -> AnyPublisher<Int, MoyaError> {
        return dataSource.registerUserInfo(nickname)
            .map { $0.statusCode }
            .eraseToAnyPublisher()
    }
}
