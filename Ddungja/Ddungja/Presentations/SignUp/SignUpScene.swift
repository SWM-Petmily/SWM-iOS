//
//  SignUpView.swift
//  Ddungja
//
//  Created by 오승기 on 2023/07/28.
//

import SwiftUI

struct SignUpScene: View {
    @State private var certificationNumber = ""
    @State private var check = true
    
    @StateObject private var viewModel: SignUpViewModel
    
    init(viewModel: SignUpViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    let maxLength = 8
    
    var body: some View {

        VStack(alignment: .leading) {
            VStack(alignment: .leading, spacing: 15) {
                Text("최초 1회 본인 인증이 필요합니다.")
                    .applyBigTitle(color: .mainTextColor)
                Text("본인 인증 시 수집된 개인정보는 서비스 이외 다른 용도로 사용되지 않습니다.")
                    .applySubhead(color: .mainTextColor)
            }
            .padding([.bottom, .top])
            
            Text("닉네임")
                .applySubtitle(color: .mainTextColor)
                .bold()
            
            VStack(alignment: .leading) {
                ZStack(alignment: Alignment(horizontal: .leading, vertical: .top)) {
                    TextField("", text: $viewModel.nickName, axis: .vertical)
                        .modifier(PlaceholderStyle(showPlaceHolder: viewModel.nickName.isEmpty, placeholder: "닉네임을 입력해주세요."))
                        .font(.system(size: 16))
                        .foregroundColor(Color.disabledText)
                        .bold()
                        .frame(maxWidth: .infinity)
                        .lineLimit(1)
                        .frame(height: 30)
                        .padding()
                        .background(Color.mainBackground)
                        .cornerRadius(10)
                        .border(viewModel.nickName.count == maxLength ? Color.red : Color.mainBackground)
                        .onChange(of: viewModel.nickName, perform: { newValue in
                            if newValue.count > maxLength {
                                viewModel.nickName = String(newValue.prefix(maxLength))
                            }
                        })
                        .onTapGesture { endTextEditing() }
                }
                
                Text("닉네임은 \(maxLength)글자를 초과할 수 없습니다!!")
                    .bold()
                    .foregroundColor(.red)
                    .isHidden(viewModel.nickName.count == maxLength ? false : true)
            }
            
            Text("휴대전화")
                .applySubtitle(color: .mainTextColor)
                .bold()
            
            GeometryReader { geo in
                VStack {
                    HStack {
                        ZStack(alignment: Alignment(horizontal: .leading, vertical: .top)) {
                            TextField("", text: $viewModel.phoneNumber, axis: .horizontal)
                                .modifier(PlaceholderStyle(showPlaceHolder: viewModel.phoneNumber.isEmpty, placeholder: "번호를 입력해주세요"))
                                .font(.system(size: 16))
                                .frame(width: geo.size.width * 0.85 * 0.8)
                                .lineLimit(1)
                                .frame(height: 30)
                                .padding()
                                .background(Color.mainBackground)
                                .cornerRadius(10)
                                .keyboardType(.numberPad)
                                .onTapGesture { endTextEditing() }
                        }
                        
                        Button {
                            viewModel.requestPhoneNumberCertification(viewModel.phoneNumber)
                        } label: {
                            Text("인증요청")
                                .bold()
                                .applyInner(color: viewModel.requestTextColor)
                                .frame(width: geo.size.width * 0.25 * 0.8)
                                .frame(height: 60)
                        }
                        .background(viewModel.requestBackgroundColor)
                        .disabled(viewModel.isActiveRequestButton)
                        .cornerRadius(10)
                        .onChange(of: viewModel.phoneNumber, perform: { _ in
                            viewModel.checkPhoneNumber()
                        })
                    }
                    
                    HStack {
                        ZStack(alignment: Alignment(horizontal: .leading, vertical: .top)) {
                            TextField("", text: $certificationNumber, axis: .horizontal)
                                .modifier(PlaceholderStyle(showPlaceHolder: certificationNumber.isEmpty, placeholder: "인증번호"))
                                .font(.system(size: 16))
                                .frame(width: geo.size.width * 0.85 * 0.8)
                                .lineLimit(1)
                                .frame(height: 30)
                                .padding()
                                .background(Color.mainBackground)
                                .keyboardType(.numberPad)
                                .cornerRadius(10)
                                .onTapGesture { endTextEditing() }
                        }
                        
                        Button {
                            viewModel.checkCertificationNumber(certificationNumber)
                        } label: {
                            Text("확인")
                                .bold()
                                .applyInner(color: .mainColor)
                                .frame(width: geo.size.width * 0.25 * 0.8)
                                .frame(height: 60)
                        }
                        .background(Color.sub)
                        .cornerRadius(10)
                        
                    }
                    .isHidden(!viewModel.showCertificationNumber)
                }
            }
            
            
            Button {
                viewModel.registerUserInfo(viewModel.nickName)
            } label: {
                Text("등록")
                    .applyInner(color: viewModel.registerTextColor)
                    .frame(height: 52)
                    .frame(maxWidth: .infinity)
            }
            .onChange(of: viewModel.isSuccessVerify, perform: { newValue in
                viewModel.register()
            })
            .onChange(of: viewModel.nickName, perform: { newValue in
                viewModel.register()
            })
            .background(viewModel.registerBackgroundColor)
            .disabled(viewModel.isActiveRegisterButton)
            .cornerRadius(14)
        }
        .analyticsScreen(name: "SignUpScene")
        .toolbar(.hidden)
        .padding()
    }
}
struct LimitedTextField: View {
    @State private var text: String = ""
    let maxLength: Int

    var body: some View {
        TextField("Enter text", text: $text)
            .onChange(of: text, perform: { newText in
                if newText.count > maxLength {
                    text = String(newText.prefix(maxLength))
                }
            })
    }
}

extension View {
    @ViewBuilder func isHidden(_ hidden: Bool, remove: Bool = false) -> some View {
        if hidden {
            if !remove {
                self.hidden()
            }
        } else {
            self
        }
    }
}
