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

struct MyPostsView: View {
    @StateObject var viewModel: MyPostsViewModel
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 15, style: .continuous)
                        .strokeBorder(viewModel.status == ButtonState.all.rawValue ? Color.main : .buttonBackground)
                        .background(viewModel.status == ButtonState.all.rawValue ? .white : .buttonBackground)
                        .cornerRadius(15)
                    
                    Button {
                        viewModel.status = ButtonState.all.rawValue
                        viewModel.getMyEditPosts(viewModel.status)
                    } label: {
                        Text("전체")
                            .bold(viewModel.status == ButtonState.all.rawValue)
                            .applyInner(
                                color:
                                    viewModel.status == ButtonState.all.rawValue ? .mainColor : .disabledTextColor
                            )
                    }
                }
                
                ZStack {
                    RoundedRectangle(cornerRadius: 15, style: .continuous)
                        .strokeBorder(viewModel.status == ButtonState.save.rawValue ? Color.main : .buttonBackground)
                        .background(viewModel.status == ButtonState.save.rawValue ? .white : .buttonBackground)
                        .cornerRadius(15)

                    Button {
                        viewModel.status = ButtonState.save.rawValue
                        viewModel.getMyEditPosts(viewModel.status)
                    } label: {
                        Text("분양중")
                            .bold(viewModel.status == ButtonState.save.rawValue)
                            .applyInner(
                                color:
                                    viewModel.status == ButtonState.save.rawValue ? .mainColor : .disabledTextColor
                            )
                    }
                }
                
                ZStack {
                    RoundedRectangle(cornerRadius: 15, style: .continuous)
                        .strokeBorder(viewModel.status == ButtonState.complete.rawValue ? Color.main : .buttonBackground)
                        .background(viewModel.status == ButtonState.complete.rawValue ? .white : .buttonBackground)
                        .cornerRadius(15)

                    Button {
                        viewModel.status = ButtonState.complete.rawValue
                        viewModel.getMyEditPosts(viewModel.status)
                    } label: {
                        Text("분양완료")
                            .bold(viewModel.status == ButtonState.complete.rawValue)
                            .applyInner(
                                color:
                                    viewModel.status == ButtonState.complete.rawValue ? .mainColor : .disabledTextColor
                            )
                    }
                }
                Spacer()
            }
            .frame(height: 33)
            .frame(maxWidth: .infinity)
            
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
    private func fetchMoreData(_ myPost: EditPostsInfoVO){
        if self.viewModel.myEditPosts.last == myPost {
            viewModel
                .fetchMoreActionSubject.send()
        }
    }
}
