//
//  SignUpProvider.swift
//  Ddungja
//
//  Created by 오승기 on 2023/06/22.
//

import Foundation
import Moya
import CombineMoya
import Combine

protocol SignUpDataSourceInterface {
    func requestCertification(about phoneNumber: String) -> AnyPublisher<Response, MoyaError>
    func checkCertification(_ certication: String) -> AnyPublisher<Response, MoyaError>
    func registerUserInfo(_ nickname: String) -> AnyPublisher<Response, MoyaError>
}

final class SignUpProvider: SignUpDataSourceInterface {
    
    let moyaProvider: MoyaProvider<SignUpAPI>
    
    init(moyaProvider: MoyaProvider<SignUpAPI> = .init()) {
        self.moyaProvider = moyaProvider
    }
    
    //휴대폰 인증번호 요청
    func requestCertification(about phoneNumber: String) -> AnyPublisher<Response, MoyaError> {
        let a = ReqeustCertificationDTO(phoneNumber: phoneNumber)
        return moyaProvider.requestPublisher(.requestCertificationNumber(phoneNumber: a))
            .eraseToAnyPublisher()
    }
    
    func checkCertification(_ certication: String) -> AnyPublisher<Response, MoyaError>  {
        let info = CertificationRequestVO(certificationNumber: certication)
        return moyaProvider.requestPublisher(.checkCertificationNumber(info: info))
            .eraseToAnyPublisher()
    }
    
    func registerUserInfo(_ nickname: String) -> AnyPublisher<Response, MoyaError> {
        let info = RegisterVO(nickname: nickname)
        return moyaProvider.requestPublisher(.userInfo(user: info))
            .eraseToAnyPublisher()
    }
}
