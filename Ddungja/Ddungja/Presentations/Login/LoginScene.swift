//
//  ContentView.swift
//  Ddungja
//
//  Created by 오승기 on 2023/06/19.
//

import SwiftUI
import AuthenticationServices

struct LoginScene: View {
    @StateObject var viewModel:LoginViewModel
    
    var body: some View {
        VStack(spacing: 10) {
            Button {
                viewModel.requestAppleLogin()
            } label: {
                Image("AppleButton")
                    .resizable()
                    .frame(height: 60)
                    .frame(maxWidth: .infinity)
            }
            .padding(10)

            Button {
                viewModel.requestKakaoLogin()
            } label: {
                Image("KakaoButton")
                    .resizable()
                    .frame(height: 60)
                    .frame(maxWidth: .infinity)
            }
            .padding(10)
        }
        .padding()
        .onOpenURL { url in
            viewModel.isKakaoTalkLoginUrl(url)
        }
    }
}
