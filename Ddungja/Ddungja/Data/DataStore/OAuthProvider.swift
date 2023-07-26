//
//  OAuthProvider.swift
//  Ddungja
//
//  Created by 오승기 on 2023/07/26.
//

import Foundation
import Combine
import KakaoSDKAuth
import KakaoSDKUser
import KakaoSDKCommon

protocol OAuthProviderInterface {
    func requestKakaoLogin() -> AnyPublisher<OAuth.KakaoVO, Error>
}

final class OAuthProvider: OAuthProviderInterface {
    
    func requestKakaoLogin() -> AnyPublisher<OAuth.KakaoVO, Error> {
        if(UserApi.isKakaoTalkLoginAvailable()) {
            return handleLoginWithKakaoTalk()
        } else {
            return handleLoginWithKakaoAcount()
        }
    }
    
    private func handleLoginWithKakaoTalk() -> AnyPublisher<OAuth.KakaoVO, Error> {
        return Future<OAuth.KakaoVO, Error> { promise in
            UserApi.shared.loginWithKakaoTalk { oauthToken, error in
                if let error = error {
                    return promise(.failure(error))
                }
                if let oauthToken = oauthToken {
                    let value = OAuth.KakaoVO(
                        accessToken: oauthToken.accessToken,
                        tokenType: oauthToken.tokenType
                    )
                    return promise(.success(value))
                }
            }
        }
        .eraseToAnyPublisher()
    }
    
    private func handleLoginWithKakaoAcount() -> AnyPublisher<OAuth.KakaoVO, Error> {
        return Future<OAuth.KakaoVO, Error> { promise in
            UserApi.shared.loginWithKakaoAccount { oauthToken, error in
                if let error = error {
                    return promise(.failure(error))
                }
                if let oauthToken = oauthToken {
                    let value = OAuth.KakaoVO(
                        accessToken: oauthToken.accessToken,
                        tokenType: oauthToken.tokenType
                    )
                    return promise(.success(value))
                }
            }
        }
        .eraseToAnyPublisher()
    }
}
