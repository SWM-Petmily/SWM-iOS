//
//  MyPostsView.swift
//  Ddungja
//
//  Created by 오승기 on 2023/07/14.
//

import SwiftUI

enum ButtonState: String {
    case all = ""
    case save = "SAVE"
    case complete = "COMPLETE"
}

struct MyPostsScene: View {
    @StateObject private var viewModel: MyPostsViewModel
    
    init(viewModel: MyPostsViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    var body: some View {
        
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                Text("전체")
                    .modifier(RadioButton(status: viewModel.status, buttonState: ButtonState.all.rawValue))
                    .onTapGesture {
                        viewModel.status = ButtonState.all.rawValue
                        viewModel.getMyEditPosts(viewModel.status)
                    }
                
                Text("분양중")
                    .modifier(RadioButton(status: viewModel.status, buttonState: ButtonState.save.rawValue))
                    .onTapGesture {
                        viewModel.status = ButtonState.save.rawValue
                        viewModel.getMyEditPosts(viewModel.status)
                    }
                
                Text("분양완료")
                    .modifier(RadioButton(status: viewModel.status, buttonState: ButtonState.complete.rawValue))
                    .onTapGesture {
                        viewModel.status = ButtonState.complete.rawValue
                        viewModel.getMyEditPosts(viewModel.status)
                    }
            }
            .frame(height: 33)
            .frame(maxWidth: .infinity)
        }
        .padding()
        
        ScrollView {
            LazyVStack {
                ForEach(viewModel.myEditPosts, id: \.postId) { info in
                    MyPostsRowVIew(viewModel: viewModel, myPost: info)
                        .onAppear{
                            print(info)
                            fetchMoreData(info)
                        }
                }
            }
        }
        .navigationTitle("작성한 분양글")
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Image(systemName: "chevron.backward")
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
            viewModel.getMyEditPosts(viewModel.status)
        }
    }
}

extension MyPostsScene {
    private func fetchMoreData(_ myPost: EditPostsInfoVO){
        if self.viewModel.myEditPosts.last == myPost {
            viewModel
                .fetchMoreActionSubject.send()
        }
    }
}
