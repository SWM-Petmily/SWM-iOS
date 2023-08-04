//
//  ApplyAdoptionView.swift
//  Ddungja
//
//  Created by 오승기 on 2023/08/04.
//

import SwiftUI

struct ApplyAdoptionView: View {
    @StateObject private var viewModel: DetailPostViewModel
    
    init(viewModel: DetailPostViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        ApplyCommonView(viewModel: viewModel.applyCommon)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Text("수정하기")
                        .applyInner(color: .mainColor)
                        .onTapGesture {
                            viewModel.moveToEditProfile()
                        }
                }
            }
        
        Button {
//            viewModel.applyCommon.
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
