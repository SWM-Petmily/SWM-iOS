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
    func requestCertification(about phoneNumber: String) -> AnyPublisher<Void, CustomErrorVO>
    func checkCertification(_ certication: String) -> AnyPublisher<Void, CustomErrorVO>
    func registerUserInfo(_ nickname: String) -> AnyPublisher<Void, CustomErrorVO>
}

final class SignUpProvider: SignUpDataSourceInterface {
    
    let moyaProvider: MoyaProvider<SignUpAPI>
    
    init(moyaProvider: MoyaProvider<SignUpAPI> = .init()) {
        self.moyaProvider = moyaProvider
    }
    
    //휴대폰 인증번호 요청
    func requestCertification(about phoneNumber: String) -> AnyPublisher<Void, CustomErrorVO> {
        let a = ReqeustCertificationDTO(phoneNumber: phoneNumber)
        return moyaProvider.requestPublisher(.requestCertificationNumber(phoneNumber: a))
            .asResult()
    }
    
    func checkCertification(_ certication: String) -> AnyPublisher<Void, CustomErrorVO> {
        let info = CertificationRequestVO(certificationNumber: certication)
        return moyaProvider.requestPublisher(.checkCertificationNumber(info: info))
            .asResult()
    }
    
    func registerUserInfo(_ nickname: String) -> AnyPublisher<Void, CustomErrorVO> {
        let info = RegisterVO(nickname: nickname)
        return moyaProvider.requestPublisher(.userInfo(user: info))
            .asResult()
    }
}
