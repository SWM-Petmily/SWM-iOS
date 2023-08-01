//
//  MyApplyPostsView.swift
//  Ddungja
//
//  Created by 오승기 on 2023/07/18.
//

import SwiftUI

enum ApplyButtonState: String {
    case all = ""
    case waiting = "WAITING"
    case approve = "APPROVED"
    case reject = "REJECTED"
    case cancel = "CANCEL"
}

struct MyApplyPostsScene: View {
    
    @StateObject private var viewModel: MyApplyPostsViewModel
    
    init(viewModel: MyApplyPostsViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                Text("전체")
                    .modifier(RadioButton(status: viewModel.status, buttonState: ApplyButtonState.all.rawValue))
                    .onTapGesture {
                        viewModel.status = ApplyButtonState.all.rawValue
                        viewModel.getMyApplyPosts(viewModel.status)
                    }
                
                Text("지원중")
                    .modifier(RadioButton(status: viewModel.status, buttonState: ApplyButtonState.waiting.rawValue))
                    .onTapGesture {
                        viewModel.status = ApplyButtonState.waiting.rawValue
                        viewModel.getMyApplyPosts(viewModel.status)
                    }
                
                Text("승인")
                    .modifier(RadioButton(status: viewModel.status, buttonState: ApplyButtonState.approve.rawValue))
                    .onTapGesture {
                        viewModel.status = ApplyButtonState.approve.rawValue
                        viewModel.getMyApplyPosts(viewModel.status)
                    }
                Text("거절")
                    .modifier(RadioButton(status: viewModel.status, buttonState: ApplyButtonState.reject.rawValue))
                    .onTapGesture {
                        viewModel.status = ApplyButtonState.reject.rawValue
                        viewModel.getMyApplyPosts(viewModel.status)
                    }
            }
            .frame(height: 33)
            .frame(maxWidth: .infinity)
        }
        .padding()
        
        ScrollView {
            LazyVStack {
                ForEach(viewModel.myApplyPosts, id: \.applyId) { info in
                    MyApplyPostsRowView(viewModel: viewModel, myPost: info)
                        .onAppear{
                            print(info)
                            fetchMoreData(info)
                        }
                }
            }
        }
        .navigationTitle("지원한 분양글")
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Text("프로필")
                    .onTapGesture {
                        viewModel.pop()
                    }
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                HStack(spacing: 15) {
                    Image(systemName: "magnifyingglass")
                    Image(systemName: "bell")
                }
            }
        }
        .onAppear {
            viewModel.getMyApplyPosts(viewModel.status)
        }
    }
}

extension MyApplyPostsScene {
    private func fetchMoreData(_ myPost: ApplyPostsInfoVO){
        if self.viewModel.myApplyPosts.last == myPost {
            viewModel
                .fetchMoreMyApplyPosts()
        }
    }
}
