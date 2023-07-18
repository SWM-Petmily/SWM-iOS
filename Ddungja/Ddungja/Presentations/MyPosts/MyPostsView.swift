//
//  MyPostsView.swift
//  Ddungja
//
//  Created by 오승기 on 2023/07/14.
//

import SwiftUI

struct MyPostsView: View {
    @StateObject var viewModel: MyPostsViewModel
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 15, style: .continuous)
                        .strokeBorder(Color.main)
                        .frame(height: 33)
                        .frame(maxWidth: .infinity)
                        .background(.white)
                    
                    Button {
                        
                    } label: {
                        Text("전체")
                            .bold()
                            .applyInner(color: .mainColor)
                    }
                }
                
                ZStack {
                    RoundedRectangle(cornerRadius: 15, style: .continuous)
                        .fill(Color.buttonBackground)
                        .frame(height: 33)
                        .frame(maxWidth: .infinity)
                    Button {
                        
                    } label: {
                        Text("분양중")
                            .applyInner(color: .disabledTextColor)
                    }
                    
                }
                ZStack {
                    RoundedRectangle(cornerRadius: 15, style: .continuous)
                        .fill(Color.buttonBackground)
                        .frame(height: 33)
                        .frame(maxWidth: .infinity)
                    Button {
                        
                    } label: {
                        Text("분양완료")
                            .applyInner(color: .disabledTextColor)
                    }
                    
                }
                Spacer()
            }
            Text("분양중")
                .applyInner(color: .mainTextColor)
                .bold()
        }
        .padding()
        
        ScrollView {
            LazyVStack {
                ForEach(viewModel.myEditPosts, id: \.postId) { info in
                    MyPostsRowVIew(myPost: info)
                        .onAppear{
                            fetchMoreData(info)
                        }
                }
            }
        }
        .navigationTitle("작성한 분양글")
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
            viewModel.getMyEditPosts(viewModel.status)
        }
    }
}

extension MyPostsView {
    private func fetchMoreData(_ myPost: PostsInfoVO){
        if self.viewModel.myEditPosts.last == myPost {
            viewModel
                .fetchMoreActionSubject.send()
        }
    }
}
