//
//  LoginAPIProvider.swift
//  Ddungja
//
//  Created by 오승기 on 2023/06/21.
//

import Foundation
import Moya
import CombineMoya
import Combine

protocol LoginDataSourceInterface {
    func requestLogin(_ oauth: OAuth) -> AnyPublisher<LoginDTO, CustomErrorVO>
    func saveFCMToken(_ token: String) -> AnyPublisher<Void, CustomErrorVO>
}

final class LoginAPIProvider: LoginDataSourceInterface {
    let moyaProvider: MoyaProvider<LoginAPI>
    
    init(moyaProvider: MoyaProvider<LoginAPI> = .init()) {
        self.moyaProvider = moyaProvider
    }
    
    func requestLogin(_ oauth: OAuth) -> AnyPublisher<LoginDTO, CustomErrorVO> {
        switch oauth {
        case let .kakao(vo):
            return moyaProvider.requestPublisher(.kakaoLogin(vo: vo))
                .asResult()

        case let .apple(vo):
            return moyaProvider.requestPublisher(.appleLogin(vo: vo))
                .asResult()
        }
    }
    
    func saveFCMToken(_ token: String) -> AnyPublisher<Void, CustomErrorVO> {
        return moyaProvider.requestPublisher(.saveToken(token: token))
            .asResult()
    }
}
