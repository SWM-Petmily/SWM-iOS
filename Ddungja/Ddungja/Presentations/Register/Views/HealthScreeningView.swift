//
//  HealthScreeningView.swift
//  Ddungja
//
//  Created by 오승기 on 2023/08/08.
//

import SwiftUI
import PhotosUI

struct HealthScreeningView: View {
    @StateObject private var viewModel: PetCertificationViewModel
    private let postId: Int
    
    init(viewModel: PetCertificationViewModel, postId: Int) {
        _viewModel = StateObject(wrappedValue: viewModel)
        self.postId = postId
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("건강검진 정보 인증 Tip!")
                .bold()
                .applyTitle(color: .mainTextColor)
            
            Text("** 건강검진 결과를 사진으로 등록해주세요!")
                .applySubhead(color: .mainTextColor)
            
            ScrollView(.horizontal) {
                HStack {
                    PhotoPickerView(viewModel: viewModel)
                        .frame(width: 108, height: 108)
                    ForEach(viewModel.image, id: \.self) { imageData in
                        if let image = UIImage(data: imageData) {
                            Image(uiImage: image)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 108, height: 108)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                .contentShape(Rectangle())
                        }
                    }
                }
            }
        }
        .padding()
        .alert(viewModel.errorTitle, isPresented: $viewModel.showAlert) {
            Button("확인", role: .cancel) {
                viewModel.pop()
            }
        } message: {
            Text(viewModel.errorDetailMessage)
        }
        
        Spacer()
        
        Button {
            viewModel.registerPetHealthInfo(postId)
        } label: {
            Text("작성완료")
                .applyInner(color: .white)
                .frame(height: 52)
                .frame(maxWidth: .infinity)
        }
        .background(Color.main)
        .cornerRadius(14)
        .padding([.leading, .trailing, .bottom])
        .sheet(isPresented: $viewModel.isShowModal, content: {
            CustomModalView(coordinator: viewModel.coordinator, title: "프로필 작성완료", message: "프로필 작성이 완료되었습니다.")
                .presentationDetents([.height(200)])
                .presentationBackgroundInteraction(.disabled)
        })
        .background(Color.sub)
        .cornerRadius(10)
    }
}
