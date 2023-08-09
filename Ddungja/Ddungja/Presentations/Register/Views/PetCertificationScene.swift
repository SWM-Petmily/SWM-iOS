//
//  PetCertificationScene.swift
//  Ddungja
//
//  Created by 오승기 on 2023/08/08.
//

import SwiftUI

struct PetCertificationScene: View {
    @StateObject private var viewModel: PetCertificationViewModel
    private let postId: Int
    
    init(viewModel: PetCertificationViewModel, postId: Int) {
        _viewModel = StateObject(wrappedValue: viewModel)
        self.postId = postId
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            VStack(alignment: .leading, spacing: 10) {
                Text("반려동물 분양등록을 완료했습니다!!")
                    .bold()
                    .applyTitle(color: .mainTextColor)
                
                Text("안전한 분양을 위해 반려동물들에 대한 추가 정보를 입력해주세요.")
                    .applySubhead(color: .mainTextColor)
                
                Text("추가정보를 작성하면 더 높은 수준의 인증 뱃지를 받으며, 검색 노출도를 확보할 수 있습니다.")
                    .applySubhead(color: .disabledTextColor)
            }
            
            ZStack(alignment: .leading) {
                ZStack(alignment: .trailing) {
                    Rectangle()
                        .fill(.white)
                        .frame(maxWidth: .infinity, minHeight: 120)
                        .cornerRadius(15)
                    Image(viewModel.registrationStatus)
                }
                
                HStack {
                    Image("PetRegistration")
                        .scaledToFill()
                        .clipped()
                        .padding(.leading)
                    
                    VStack(alignment: .leading, spacing: 10) {
                        Text("반려동물 등록 인증")
                            .bold()
                            .applyBigTitle(color: .mainTextColor)
                        
                        Text("동물 등록 번호를 이용한 반려동물을 인증하는 과정입니다.")
                            .applySubhead(color: .mainTextColor)
                    }
                }
                
            }
            .shadow(color: .gray.opacity(0.3), radius: 10, x: 0, y: 0)
            
            ZStack(alignment: .leading) {
                ZStack(alignment: .trailing) {
                    Rectangle()
                        .fill(.white)
                        .frame(maxWidth: .infinity, minHeight: 120)
                        .cornerRadius(15)
                    Image(viewModel.vaccinationStatus)
                }
                
                
                HStack {
                    Image("Vaccination")
                        .scaledToFill()
                        .clipped()
                        .padding(.leading)
                    VStack(alignment: .leading, spacing: 10) {
                        Text("예방접종 인증")
                            .bold()
                            .applyBigTitle(color: .mainTextColor)
                        
                        Text("예방접종을 받은 반려동물을 인증하는 과정입니다.")
                            .applySubhead(color: .mainTextColor)
                    }
                }
                
            }
            .shadow(color: .gray.opacity(0.3), radius: 10, x: 0, y: 0)
            
            ZStack(alignment: .leading) {
                ZStack(alignment: .trailing) {
                    Rectangle()
                        .fill(.white)
                        .frame(maxWidth: .infinity, minHeight: 120)
                        .cornerRadius(15)
                    Image(viewModel.healthScreeningStatus)
                }
                HStack {
                    Image("HealthScreening")
                        .scaledToFill()
                        .clipped()
                        .padding(.leading)
                    VStack(alignment: .leading, spacing: 10) {
                        Text("건강검진정보 인증")
                            .bold()
                            .applyBigTitle(color: .mainTextColor)
                        
                        Text("건강검진 정보 업로드를 통해 반려동물의 질병과 상태를 파악하는 과정입니다.")
                            .applySubhead(color: .mainTextColor)
                    }
                }
                
            }
            .shadow(color: .gray.opacity(0.3), radius: 10, x: 0, y: 0)
            
            
            Button {
                //                viewModel.push(.adoptionReason)
            } label: {
                Text("등록 1/6")
                    .applyInner(color: .white)
                    .frame(height: 52)
                    .frame(maxWidth: .infinity)
            }
            .background(Color.main)
            .cornerRadius(14)
            .padding([.leading, .trailing, .bottom])
        }
        .padding()
        .onAppear {
            viewModel.getAdditionalPageInfo(postId)
        }
    }
}

struct PetCertificationScene_Previews: PreviewProvider {
    static var previews: some View {
        PetCertificationScene()
    }
}
