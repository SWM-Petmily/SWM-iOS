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
    func checkCertification(_ id: Int,_ phone: String,_ certication: String) -> AnyPublisher<Response, MoyaError>
    func registerUserInfo(_ id: Int, _ nickname: String, _ phoneNumber: String) -> AnyPublisher<Response, MoyaError>
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
    
    func checkCertification(_ id: Int,_ phone: String,_ certication: String) -> AnyPublisher<Response, MoyaError>  {
        let info = CertificationRequestVO(certificationId: id, phoneNumber: phone, certificationNumber: certication)
        return moyaProvider.requestPublisher(.checkCertificationNumber(info: info))
            .eraseToAnyPublisher()
    }
    
    func registerUserInfo(_ id: Int, _ nickname: String, _ phoneNumber: String) -> AnyPublisher<Response, MoyaError> {
        let info = RegisterVO(certificationId: id, nickname: nickname, phone: phoneNumber)
        return moyaProvider.requestPublisher(.userInfo(user: info))
            .eraseToAnyPublisher()
    }
}
