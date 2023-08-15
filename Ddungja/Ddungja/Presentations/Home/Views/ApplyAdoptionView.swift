//
//  ApplyAdoptionView.swift
//  Ddungja
//
//  Created by 오승기 on 2023/08/04.
//

import SwiftUI

struct ApplyAdoptionView: View {
    @StateObject private var viewModel: ApplyCommonViewModel
    private let postId: Int
    init(viewModel: ApplyCommonViewModel, postId: Int) {
        _viewModel = StateObject(wrappedValue: viewModel)
        self.postId = postId
    }
    
    var body: some View {
        ZStack {
            CustomAlert(presentAlert: $viewModel.showAlert, alertType: .error(title: viewModel.errorTitle, message: viewModel.errorDetailMessage, icon: viewModel.errorIcon, iconColor: viewModel.errorIconColor), coordinator: viewModel.coordinator)
                .isHidden(!viewModel.showAlert)
            VStack {
                ApplyCommonView(viewModel: viewModel, postId: postId)
                    .navigationBarBackButtonHidden()
                    .toolbar {
                        if !viewModel.showAlert {
                            ToolbarItem(placement: .navigationBarLeading) {
                                Image(systemName: "chevron.backward")
                                    .onTapGesture {
                                        viewModel.pop()
                                    }
                            }
                            if viewModel.showEditButton {
                                ToolbarItem(placement: .navigationBarTrailing) {
                                    Text("수정하기")
                                        .applyInner(color: .mainColor)
                                        .onTapGesture {
                                            viewModel.push(.editProfile(isRegister: true))
                                        }
                                }
                            }
                        }
                    }
                
                Button {
                    viewModel.postApply(postId)
                } label: {
                    Text("입양 신청하기")
                        .applyInner(color: .white)
                        .bold()
                        .frame(maxWidth: .infinity)
                        .frame(height: 52)
                        .background(Color.main)
                        .cornerRadius(15)
                }
                .padding()
            }
            
            Color.black.opacity(0.75)
                .edgesIgnoringSafeArea(.all)
                .isHidden(!viewModel.isSucceedPost)
        }
        .sheet(isPresented: $viewModel.isSucceedPost) {
            CustomModalView(coordinator: viewModel.coordinator, title: "지원 요청완료", message: "성공적으로 지원을 완료하였습니다.")
                .presentationDetents([.height(200)])
                .presentationBackgroundInteraction(.disabled)
        }
    }
}
