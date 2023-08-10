//
//  LoginUsecase.swift
//  Ddungja
//
//  Created by 오승기 on 2023/07/25.
//

import Combine
import Moya

protocol LoginUsecaseInterface {
    func requestKakaoLogin() -> AnyPublisher<LoginResultVO, Error>
    func requestAppleLogin() -> AnyPublisher<LoginResultVO, Error>
}

final class LoginUsecase: LoginUsecaseInterface {
    
    let repository: LoginRepository
    
    init(repository: LoginRepository) {
        self.repository = repository
    }
    
    func requestKakaoLogin() -> AnyPublisher<LoginResultVO, Error> {
        return repository.requestKakaoLogin()
            .flatMap { vo -> AnyPublisher<LoginResultVO, Error> in
                self.repository.postLogin(OAuth.kakao(vo))
                    .catch { error -> Fail in
                        return Fail(error: error)
                    }
                    .map { loginVO in
                        KeyChainManager.create(key: .userId, token: String(loginVO.userId))
                        KeyChainManager.create(key: .accessToken, token: loginVO.accessToken)
                        KeyChainManager.create(key: .refreshToken, token: loginVO.refreshToken)
                        return loginVO.isCertification ? .certification : .nonCertification
                    }
                    .eraseToAnyPublisher()
            }
            .eraseToAnyPublisher()
    }
    
    func requestAppleLogin() -> AnyPublisher<LoginResultVO, Error> {
        return repository.requestAppleLogin()
            .flatMap { vo -> AnyPublisher<LoginResultVO, Error> in
                self.repository.postLogin(OAuth.apple(vo))
                    .catch { error -> Fail in
                        return Fail(error: error)
                    }
                    .map { loginVO in
                        KeyChainManager.create(key: .userId, token: String(loginVO.userId))
                        KeyChainManager.create(key: .accessToken, token: loginVO.accessToken)
                        KeyChainManager.create(key: .refreshToken, token: loginVO.refreshToken)
                        return loginVO.isCertification ? .certification : .nonCertification
                    }
                    .eraseToAnyPublisher()
            }
            .eraseToAnyPublisher()
    }
}
