//
//  LoginToVORepository.swift
//  Ddungja
//
//  Created by 오승기 on 2023/06/23.
//

import Combine
import Moya

class LoginToVORepository: LoginRepository {

    let loginDataSource: LoginDataSourceInterface
    let oauthDataSource: OAuthProviderInterface
    
    init(loginDataSource: LoginDataSourceInterface, oauthDataSource: OAuthProviderInterface) {
        self.loginDataSource = loginDataSource
        self.oauthDataSource = oauthDataSource
    }
    
    func requestKakaoLogin() -> AnyPublisher<OAuth.KakaoVO, Error> {
        return oauthDataSource.requestKakaoLogin().eraseToAnyPublisher()
    }
    
    func requestAppleLogin() -> AnyPublisher<OAuth.AppleVO, Error> {
        return oauthDataSource.requestAppleLogin().eraseToAnyPublisher()
    }
    
    func postLogin(_ oauth: OAuth) -> AnyPublisher<LoginVO, MoyaError> {
        loginDataSource.requestLogin(oauth)
            .map { $0.toLoginVO() }
            .eraseToAnyPublisher()
    }

}
