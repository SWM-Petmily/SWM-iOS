//
//  PetRegistrationView.swift
//  Ddungja
//
//  Created by 오승기 on 2023/08/08.
//

import SwiftUI

struct PetRegistrationView: View {
    private let viewModel: PetCertificationViewModel
    @State private var test = ""
    
    init(viewModel: PetCertificationViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Text("반려동물 분양 등록번호 인증 TIP!")
                    .bold()
                    .applyTitle(color: .mainTextColor)
                
                Text("**반려동물 등록 시 보호자의 성명을 입력해주세요")
                    .applySubhead(color: .mainTextColor)
                
                Text("** 동물 등록번호는 410으로 시작하는 15자리의 숫자입니다.")
                    .applySubhead(color: .mainTextColor)
                
                Text("ex) 예시 이미지")
                    .applySubtitle(color: .mainTextColor)
                
                ZStack(alignment: .topTrailing) {
                    Image("RegisterCard")
                    Image("bulldog")
                        .padding(.top)
                        .padding(.trailing, 60)
                }
                
                Text("성명")
                    .applySubtitle(color: .mainTextColor)
                    .bold()
                
                HStack(spacing: 20) {
                    ZStack(alignment: Alignment(horizontal: .leading, vertical: .top)) {
                        TextField("", text: $test, axis: .horizontal)
                            .modifier(PlaceholderStyle(showPlaceHolder: test.isEmpty, placeholder: "입력해주세요"))
                            .font(.system(size: 16))
                            .lineLimit(1)
                            .frame(height: 30)
                            .padding()
                            .background(Color.mainBackground)
                            .cornerRadius(10)
                            .onTapGesture { endTextEditing() }
                    }
                }
                
                Text("동물등록번호")
                    .applySubtitle(color: .mainTextColor)
                    .bold()
                
                HStack(spacing: 20) {
                    ZStack(alignment: Alignment(horizontal: .leading, vertical: .top)) {
                        TextField("", text: $test, axis: .horizontal)
                            .modifier(PlaceholderStyle(showPlaceHolder: test.isEmpty, placeholder: "입력해주세요"))
                            .font(.system(size: 16))
                            .lineLimit(1)
                            .frame(height: 30)
                            .padding()
                            .background(Color.mainBackground)
                            .keyboardType(.numberPad)
                            .cornerRadius(10)
                            .onTapGesture { endTextEditing() }
                    }
                    
                    Button {
                
                    } label: {
                        Text("확인")
                            .bold()
                            .applyInner(color: .mainColor)
                            .frame(height: 60)
                            .padding([.leading, .trailing], 20)
                    }
                    .background(Color.sub)
                    .cornerRadius(10)
                    
                }
                
                Spacer()
            }
            .padding()
        }
        
        
        Button {
            
        } label: {
            Text("건너뛰기")
                .applyInner(color: .white)
                .frame(height: 52)
                .frame(maxWidth: .infinity)
        }
        .background(Color.main)
        .cornerRadius(14)
        .padding([.leading, .trailing, .bottom])
    }
}

struct PetRegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        PetRegistrationView()
    }
}
