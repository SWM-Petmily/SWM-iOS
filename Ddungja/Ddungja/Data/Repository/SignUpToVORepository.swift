//
//  SignUpToVORepository.swift
//  Ddungja
//
//  Created by 오승기 on 2023/06/23.
//

import Combine

final class SignUpToVORepository: SignUpRepository {
    
    private let dataSource: SignUpDataSourceInterface
    
    init(dataSource: SignUpDataSourceInterface) {
        self.dataSource = dataSource
    }
    
    func requestCertification(about phoneNumber: String) -> AnyPublisher<Void, CustomErrorVO> {
        return dataSource.requestCertification(about: phoneNumber)
            .eraseToAnyPublisher()
    }
    
    func checkCertification(_ certication: String) -> AnyPublisher<Void, CustomErrorVO> {
        return dataSource.checkCertification(certication)
            .eraseToAnyPublisher()
    }
    
    func registerUserInfo(_ nickname: String) -> AnyPublisher<Void, CustomErrorVO> {
        return dataSource.registerUserInfo(nickname)
            .eraseToAnyPublisher()
    }
}
