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

final class SignUpProvider {
    let moyaProvider: MoyaProvider<SignUpAPI>
    
    init(moyaProvider: MoyaProvider<SignUpAPI> = .init()) {
        self.moyaProvider = moyaProvider
    }
    
    //휴대폰 인증번호 요청
    func getCertificationNumber() -> AnyPublisher<CertificationNumberDTO, MoyaError> {
        return moyaProvider.requestPublisher(.requestCertificationNumber(phoneNumber: ""))
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
