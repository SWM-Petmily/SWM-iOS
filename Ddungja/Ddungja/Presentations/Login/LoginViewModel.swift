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
                    self.push(.tapBar)
                    print("certification")
                case .nonCertification:
                    print("nonCertification")
                    self.push(.signup)
                }
                self.saveFCMToken()
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
                    self.push(.tapBar)
                case .nonCertification:
                    print("Apple nonCertification")
                    self.push(.signup)
                }
                self.saveFCMToken()
            }
            .store(in: &cancellables)
    }
    
    private func saveFCMToken() {
        loginUsecase.saveFCMToken()
            .sink { error in
                print("failed save FCM TOKEN \(error)")
            } receiveValue: { _ in
                print("success save FCM TOKEN")
            }
            .store(in: &cancellables)
    }
    
    func isKakaoTalkLoginUrl(_ url: URL) {
        if AuthApi.isKakaoTalkLoginUrl(url) {
            _ = AuthController.handleOpenUrl(url: url)
        }
    }
}
