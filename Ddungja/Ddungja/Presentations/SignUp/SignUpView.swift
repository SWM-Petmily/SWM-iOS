//
//  SignUpView.swift
//  Ddungja
//
//  Created by 오승기 on 2023/07/28.
//

import SwiftUI

struct SignUpView: View {
    @State private var nickName = ""
    @State private var phoneNumber = ""
    @State private var check = true
    let maxLength = 8
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("최초 1회 본인 인증이 필요합니다.")
            Text("본인 인증 시 수집된 개인정보는 서비스 이외 다른 용도로 사용되지 않습니다.")
        }
        
        
        VStack(alignment: .leading) {
            Text("닉네임")
                .applySubtitle(color: .mainTextColor)
                .bold()
            
            VStack(alignment: .leading) {
                ZStack(alignment: Alignment(horizontal: .leading, vertical: .top)) {
                    TextField("", text: $nickName, axis: .vertical)
                        .placeholder(when: nickName.isEmpty, text: "닉네임을 입력해주세요.")
                        .font(.system(size: 16))
                        .foregroundColor(Color.disabledText)
                        .bold()
                        .frame(maxWidth: .infinity)
                        .lineLimit(1)
                        .frame(height: 30)
                        .padding()
                        .background(Color.mainBackground)
                        .cornerRadius(10)
                        .border(nickName.count == maxLength ? Color.red : Color.mainBackground)
                        .onChange(of: phoneNumber, perform: { newValue in
                            if newValue.count > maxLength {
                                nickName = String(newValue.prefix(maxLength))
                            }
                        })
                        .onTapGesture { endTextEditing() }
                }
                
                Text("닉네임은 \(maxLength)글자를 초과할 수 없습니다!!")
                    .bold()
                    .foregroundColor(.red)
                    .isHidden(nickName.count == maxLength ? false : true)
            }
            
            Text("휴대전화")
                .applySubtitle(color: .mainTextColor)
                .bold()
            
                GeometryReader { geo in
                    VStack {
                        HStack {
                            ZStack(alignment: Alignment(horizontal: .leading, vertical: .top)) {
                                TextField("", text: $phoneNumber, axis: .horizontal)
                                    .placeholder(when: phoneNumber.isEmpty, text: "번호를 입력해주세요")
                                    .font(.system(size: 16))
                                    .frame(width: geo.size.width * 0.85 * 0.8)
                                    .lineLimit(1)
                                    .frame(height: 30)
                                    .padding()
                                    .background(Color.mainBackground)
                                    .cornerRadius(10)
                                    .onTapGesture { endTextEditing() }
                            }
                            
                            Button {
                                
                            } label: {
                                Text("인증요청")
                                    .bold()
                                    .applyInner(color: .mainColor)
                                    .frame(width: geo.size.width * 0.25 * 0.8)
                                    .frame(height: 60)
                            }
                            .background(Color.sub)
                            .cornerRadius(10)
                            
                        }
                        
                        HStack {
                            ZStack(alignment: Alignment(horizontal: .leading, vertical: .top)) {
                                TextField("", text: $phoneNumber, axis: .horizontal)
                                    .placeholder(when: phoneNumber.isEmpty, text: "인증번호")
                                    .font(.system(size: 16))
                                    .frame(width: geo.size.width * 0.85 * 0.8)
                                    .lineLimit(1)
                                    .frame(height: 30)
                                    .padding()
                                    .background(Color.mainBackground)
                                    .cornerRadius(10)
                                    .onTapGesture { endTextEditing() }
                            }
                            
                            Button {
                                
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
                    }
                }
            
            
            Button {
                
            } label: {
                Text("등록")
                    .applyInner(color: check ? .disabledTextColor : .white)
                    .frame(height: 52)
                    .frame(maxWidth: .infinity)
            }
            .background(check ? Color.buttonBackground : Color.main)
            .disabled(check)
            .cornerRadius(14)
        }
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
