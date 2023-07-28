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
import AuthenticationServices

protocol OAuthProviderInterface {
    func requestKakaoLogin() -> AnyPublisher<OAuth.KakaoVO, Error>
    func requestAppleLogin() -> AnyPublisher<OAuth.AppleVO, Error>
}

final class OAuthProvider: NSObject, OAuthProviderInterface {
    
    private let appleSubject = PassthroughSubject<OAuth.AppleVO, Error>()
    
    func requestAppleLogin() -> AnyPublisher<OAuth.AppleVO, Error> {
        let provider = ASAuthorizationAppleIDProvider()
        let request = provider.createRequest()
        request.requestedScopes = [.fullName, .email]
        
        let controller = ASAuthorizationController(authorizationRequests: [request])
        controller.delegate = self
        controller.presentationContextProvider = self as? ASAuthorizationControllerPresentationContextProviding
        controller.performRequests()
        
        return appleSubject.eraseToAnyPublisher()
    }

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

extension OAuthProvider: ASAuthorizationControllerDelegate {
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        switch authorization.credential {
        case let appleId as ASAuthorizationAppleIDCredential:
            let accesstoken = String(data: appleId.authorizationCode ?? Data(), encoding: .utf8) ?? ""
            let idToken = String(data: appleId.identityToken ?? Data(), encoding: .utf8) ?? ""
            let vo = OAuth.AppleVO(accessToken: accesstoken, idToken: idToken)
            appleSubject.send(vo)
        default:
            break
        }
    }
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        if let authorizationError = error as? ASAuthorizationError {
            appleSubject.send(completion: .failure(authorizationError))
        }
    }
}
