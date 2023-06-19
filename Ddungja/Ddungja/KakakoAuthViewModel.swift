//
//  KakakoAuthViewModel.swift
//  Ddungja
//
//  Created by 오승기 on 2023/06/19.
//

import Foundation
import Combine
import KakaoSDKAuth
import KakaoSDKUser

class KakakoAuthViewModel: ObservableObject {
    @Published var isLoggedIn = false
    
    //MARK: - Internal
    @MainActor
    func handleKakaoApi() {
        Task {
            if (UserApi.isKakaoTalkLoginAvailable()) {
                isLoggedIn = await handleLoginWithKakaoTalk()
            } else {
                isLoggedIn = await handleLoginWithKakaoAcount()
            }
        }
    }
    
    //MARK: - Private
    @MainActor
    private func handleLoginWithKakaoTalk() async -> Bool {
        return await withCheckedContinuation { continuation in
            UserApi.shared.loginWithKakaoTalk {(oauthToken, error) in
                if let error = error {
                    print(error)
                    continuation.resume(returning: false)
                } else {
                    print("loginWithKakaoTalk() success.")

                    _ = oauthToken
                    continuation.resume(returning: true)
                }
            }
        }
    }
    
    @MainActor
    private func handleLoginWithKakaoAcount() async -> Bool {
        return await withCheckedContinuation { continuation in
            UserApi.shared.loginWithKakaoAccount {(oauthToken, error) in
                if let error = error {
                    print(error)
                    continuation.resume(returning: false)
                } else {
                    print("loginWithKakaoAccount() success.")

                    _ = oauthToken
                    continuation.resume(returning: true)
                }
            }
        }
    }
}
