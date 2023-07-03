//
//  DdungjaApp.swift
//  Ddungja
//
//  Created by 오승기 on 2023/06/19.
//

import SwiftUI
import KakaoSDKCommon
import KakaoSDKAuth

@main
struct DdungjaApp: App {
    
    init() {
        let kakaoAppKey = Bundle.main.infoDictionary?["KAKAO_API_LOGIN_KEY"] ?? ""
    
        // Kakao SDK 초기화
        KakaoSDK.initSDK(appKey: kakaoAppKey as! String)
    }
    
    var body: some Scene {
        WindowGroup {
            // onOpenURL()을 사용해 커스텀 URL 스킴 처리
//            LoginView().onOpenURL(perform: { url in
//                print("url is here: \(url)")
//                if (AuthApi.isKakaoTalkLoginUrl(url)) {
//                    AuthController.handleOpenUrl(url: url)
//                }
//            })
            NavigationStack {
                LoginView()
                    .navigationBarHidden(true)
            }
        }
    }
}
