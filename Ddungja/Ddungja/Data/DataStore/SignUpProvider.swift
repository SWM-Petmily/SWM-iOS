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
    func requestCertification(about phoneNumber: String) -> AnyPublisher<CertificationNumberDTO, MoyaError>
}

final class SignUpProvider: SignUpDataSourceInterface {
    
    let moyaProvider: MoyaProvider<SignUpAPI>
    
    init(moyaProvider: MoyaProvider<SignUpAPI> = .init()) {
        self.moyaProvider = moyaProvider
    }
    
    //휴대폰 인증번호 요청
    func requestCertification(about phoneNumber: String) -> AnyPublisher<CertificationNumberDTO, MoyaError> {
        let a = ReqeustCertificationDTO(phoneNumber: phoneNumber)
        return moyaProvider.requestPublisher(.requestCertificationNumber(phoneNumber: a))
            .eraseToAnyPublisher()
            .map(CertificationNumberDTO.self)
    }
    
    func getDuplicate() -> AnyPublisher<ConfirmNumberDTO, MoyaError> {
        return moyaProvider.requestPublisher(.checkCertificationNumber(phoneNumber: "", certificationNumber: ""))
            .map(ConfirmNumberDTO.self)
    }
    
    func getAccessToken() -> AnyPublisher<UserInfoDTO, MoyaError> {
        return moyaProvider.requestPublisher(.userInfo)
            .map(UserInfoDTO.self)
    }
}
