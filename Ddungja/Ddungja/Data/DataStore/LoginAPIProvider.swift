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
    func requestKakaoLogin(_ oauth: OAuth) -> AnyPublisher<LoginDTO, MoyaError>
}

final class LoginAPIProvider: LoginDataSourceInterface {
    let moyaProvider: MoyaProvider<LoginAPI>
    
    init(moyaProvider: MoyaProvider<LoginAPI> = .init()) {
        self.moyaProvider = moyaProvider
    }
    
    func requestKakaoLogin(_ oauth: OAuth) -> AnyPublisher<LoginDTO, MoyaError> {
        switch oauth {
        case let .kakao(vo):
            return moyaProvider.requestPublisher(.kakaoLogin(vo: vo))
                .retry(3)
                .eraseToAnyPublisher()
                .map(LoginDTO.self)

        case let .apple(vo):
            return moyaProvider.requestPublisher(.appleLogin(vo: vo))
                .retry(3)
                .eraseToAnyPublisher()
                .map(LoginDTO.self)
        }
    }
}
