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
        CarouselScene()
        
        Spacer()
        
        VStack(spacing: 15) {
            Button {
                viewModel.requestAppleLogin()
            } label: {
                Image("AppleButton")
                    .resizable()
                    .frame(height: 50)
                    .frame(maxWidth: .infinity)
            }

            Button {
                viewModel.requestKakaoLogin()
            } label: {
                Image("KakaoButton")
                    .resizable()
                    .frame(height: 50)
                    .frame(maxWidth: .infinity)
            }
        }
        .padding(20)
        .onOpenURL { url in
            viewModel.isKakaoTalkLoginUrl(url)
        }
    }
}
