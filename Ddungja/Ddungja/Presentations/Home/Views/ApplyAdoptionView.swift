//
//  ApplyAdoptionView.swift
//  Ddungja
//
//  Created by 오승기 on 2023/08/04.
//

import SwiftUI

struct ApplyAdoptionView: View {
    @StateObject private var viewModel: DetailPostViewModel
    private let postId: Int
    init(viewModel: DetailPostViewModel, postId: Int) {
        _viewModel = StateObject(wrappedValue: viewModel)
        self.postId = postId
    }
    
    var body: some View {
        ApplyCommonView(viewModel: viewModel.applyCommon, postId: postId)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Text("수정하기")
                        .applyInner(color: .mainColor)
                        .onTapGesture {
                            viewModel.push(.editProfile)
                        }
                }
            }
        
        Button {
            viewModel.applyCommon.postApply(postId)
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
}
