//
//  ApplyModifyVIew.swift
//  Ddungja
//
//  Created by 오승기 on 2023/07/23.
//

import SwiftUI

struct ApplyModifyVIew: View {
    @StateObject private var viewModel: MyApplyPostsViewModel
    private var id: Int
    
    init(viewModel: MyApplyPostsViewModel, id: Int) {
        _viewModel = StateObject(wrappedValue: viewModel)
        self.id = id
    }
    
    var body: some View {
        VStack {
            ApplyCommonView(viewModel: viewModel.applyViewModel, postId: id)
                .navigationTitle("지원하기")
                .navigationBarBackButtonHidden()
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Image(systemName: "chevron.backward")
                            .onTapGesture {
                                viewModel.pop()
                            }
                    }
                }
            
            CustomLazyVGrid(col: 2, spacing: 10) {
                Button {
                    throttleButton(id: id)
                } label: {
                    Text("삭제")
                        .applyInner(color: .mainColor)
                        .bold()
                        .frame(maxWidth: .infinity)
                        .frame(height: 45)
                        .background(Color.rejectButton)
                        .cornerRadius(15)
                }
                
                Button {
                    viewModel.push(.editProfile(isRegister: true))
                } label: {
                    Text("수정하기")
                        .applyInner(color: .white)
                        .bold()
                        .frame(maxWidth: .infinity)
                        .frame(height: 45)
                        .background(Color.main)
                        .cornerRadius(15)
                }
            }
            .padding([.leading, .trailing, .bottom])
        }
        .alert(viewModel.errorTitle, isPresented: $viewModel.showAlert) {
            Button("확인", role: .cancel) {
                viewModel.pop()
            }
        } message: {
            Text(viewModel.errorDetailMessage)
        }
    }
}

extension ApplyModifyVIew {
    private func throttleButton(id: Int) {
        viewModel.deleteEvent.send(id)
    }
}
