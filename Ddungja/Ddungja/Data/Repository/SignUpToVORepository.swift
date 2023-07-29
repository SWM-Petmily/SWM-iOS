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
    
    func requestCertification(about phoneNumber: String) -> AnyPublisher<CertificationNumberVO, MoyaError> {
        return dataSource.requestCertification(about: phoneNumber)
            .map { $0.toNumberVO() }
            .eraseToAnyPublisher()
    }
}
