//
//  ApplyListView.swift
//  Ddungja
//
//  Created by 오승기 on 2023/07/20.
//

import SwiftUI

struct ApplyListScene: View {
    @StateObject private var viewModel: MyPostsViewModel
    private var postId: Int
    
    init(viewModel: MyPostsViewModel, id: Int) {
        _viewModel = StateObject(wrappedValue: viewModel)
        self.postId = id
    }
    
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(viewModel.applyLists, id: \.applyId) { info in
                    ApplyListRowView(viewModel: viewModel, vo: info)
                        .onAppear {
                            fetchMoreApplyListData(info, postId)
                        }
                        .onTapGesture {
                            viewModel.push(.detailApply(id: info.applyId))
                        }
                }
            }
        }
        .navigationTitle("지원 받은 목록")
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Image(systemName: "chevron.backward")
                    .onTapGesture {
                        viewModel.pop()
                    }
            }
        }
        .onAppear {
            viewModel.getApplyList(id: postId)
        }
        .alert(viewModel.errorTitle, isPresented: $viewModel.showAlert) {
            Button("확인", role: .cancel) {
                viewModel.pop()
            }
        } message: {
            Text(viewModel.errorDetailMessage)
        }
        .padding()
    }
}

extension ApplyListScene {
    private func fetchMoreApplyListData(_ applyList: ApplyListInfoVO, _ postId: Int){
        if self.viewModel.applyLists.last == applyList {
            viewModel.fetchMoreApplyList(id: postId)
        }
    }
}
