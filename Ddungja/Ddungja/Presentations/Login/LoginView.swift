//
//  ContentView.swift
//  Ddungja
//
//  Created by 오승기 on 2023/06/19.
//

import SwiftUI
import AuthenticationServices

struct LoginView: View {
    @StateObject var viewModel:LoginViewModel
    
    var body: some View {
        VStack(spacing: 20) {
            SignInWithAppleButtonView()
                .frame(height: 60)
                .frame(maxWidth: .infinity)
                .onTapGesture {
                    viewModel.requestAppleLogin()
                }

            Button {
                viewModel.requestKakaoLogin()
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color.theme.kakaoContainerColor)
                        .frame(height: 50)
                        .frame(maxWidth: .infinity)

                    HStack(alignment: .center) {
                        Image("KakaoSymbol")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .padding(.leading)

                        Spacer()

                        Text("카카오 로그인")
                            .font(.system(size: 14))
                            .foregroundColor(Color.theme.kakaoLabelColor)
                            .bold()
                        
                        Spacer()
                    }
                }
            }
            .padding(20)
        }
        .padding()
        .onOpenURL { url in
            viewModel.isKakaoTalkLoginUrl(url)
        }
    }
}

struct SignInWithAppleButtonView: UIViewRepresentable {
    
    typealias UIViewType = UIView
    
    func makeUIView(context: Context) -> UIView {
        return ASAuthorizationAppleIDButton()
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
    }
}
