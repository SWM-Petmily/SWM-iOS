//
//  KakakoAuthViewModel.swift
//  Ddungja
//
//  Created by 오승기 on 2023/06/19.
//

import Foundation
import Combine
import KakaoSDKAuth

final class LoginViewModel: BaseViewModel {
    private let loginUsecase: LoginUsecaseInterface
    private var cancellables = Set<AnyCancellable>()
    
    init(coordinator: CoordinatorProtocol, loginUsecase: LoginUsecaseInterface) {
        self.loginUsecase = loginUsecase
        
        super.init(coordinator: coordinator)
    }
    
    func requestKakaoLogin() {
        loginUsecase.requestKakaoLogin()
            .sink { error in
                print(error)
            } receiveValue: { vo in
                switch vo {
                case .certification:
                    print("certification")
                case .nonCertification:
                    print("nonCertification")
                }
            }
            .store(in: &cancellables)
    }
    
    func requestAppleLogin() {
        loginUsecase.requestAppleLogin()
            .sink { error in
                print(error)
            } receiveValue: { vo in
                switch vo {
                case .certification:
                    print("Apple certification")
                case .nonCertification:
                    print("Apple nonCertification")
                }
            }
            .store(in: &cancellables)
    }
    
    func isKakaoTalkLoginUrl(_ url: URL) {
        if AuthApi.isKakaoTalkLoginUrl(url) {
            _ = AuthController.handleOpenUrl(url: url)
        }
    }
}
