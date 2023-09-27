//
//  CertificationCommonView.swift
//  Ddungja
//
//  Created by 오승기 on 2023/09/27.
//

import SwiftUI
import PhotosUI

struct CertificationCommonView: View {
    @StateObject private var viewModel: PetCertificationViewModel
    private let title: String
    private let tip: String
    private let postId: Int
    private let type: PetHealthData
    
    init(viewModel: PetCertificationViewModel, title: String, tip: String, postId: Int, type: PetHealthData) {
        _viewModel = StateObject(wrappedValue: viewModel)
        self.title = title
        self.tip = tip
        self.postId = postId
        self.type = type
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text(title)
                .bold()
                .applyTitle(color: .mainTextColor)
            
            Text(tip)
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
        .analyticsScreen(name: title)
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
            viewModel.registerPetInfo(type, postId)
        } label: {
            Text("작성완료")
                .applyInner(color: .white)
                .frame(height: 52)
                .frame(maxWidth: .infinity)
        }
        .background(Color.main)
        .cornerRadius(14)
        .padding([.leading, .trailing, .bottom])
        .sheet(isPresented: $viewModel.isShowModal) {
            CustomModalView(coordinator: viewModel.coordinator, title: "프로필 작성완료", message: "프로필 작성이 완료되었습니다.")
                .presentationDetents([.height(200)])
        }
        .background(Color.sub)
        .cornerRadius(10)
    }
}
