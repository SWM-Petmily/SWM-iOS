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

struct MyApplyPostsView: View {
    
    @StateObject private var viewModel: MyApplyPostsViewModel
    
    init(viewModel: MyApplyPostsViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 15, style: .continuous)
                        .strokeBorder(viewModel.status == ApplyButtonState.all.rawValue ? Color.main : .buttonBackground)
                        .background(viewModel.status == ApplyButtonState.all.rawValue ? .white : .buttonBackground)
                        .cornerRadius(15)
                    
                    Button {
                        viewModel.status = ApplyButtonState.all.rawValue
                        viewModel.getMyApplyPosts(viewModel.status)
                    } label: {
                        Text("전체")
                            .bold(viewModel.status == ApplyButtonState.all.rawValue)
                            .applyInner(
                                color:
                                    viewModel.status == ApplyButtonState.all.rawValue ? .mainColor : .disabledTextColor
                            )
                    }
                }
                
                ZStack {
                    RoundedRectangle(cornerRadius: 15, style: .continuous)
                        .strokeBorder(viewModel.status == ApplyButtonState.waiting.rawValue ? Color.main : .buttonBackground)
                        .background(viewModel.status == ApplyButtonState.waiting.rawValue ? .white : .buttonBackground)
                        .cornerRadius(15)

                    Button {
                        viewModel.status = ApplyButtonState.waiting.rawValue
                        viewModel.getMyApplyPosts(viewModel.status)
                    } label: {
                        Text("지원중")
                            .bold(viewModel.status == ApplyButtonState.waiting.rawValue)
                            .applyInner(
                                color:
                                    viewModel.status == ApplyButtonState.waiting.rawValue ? .mainColor : .disabledTextColor
                            )
                    }
                }
                
                ZStack {
                    RoundedRectangle(cornerRadius: 15, style: .continuous)
                        .strokeBorder(viewModel.status == ApplyButtonState.approve.rawValue ? Color.main : .buttonBackground)
                        .background(viewModel.status == ApplyButtonState.approve.rawValue ? .white : .buttonBackground)
                        .cornerRadius(15)

                    Button {
                        viewModel.status = ApplyButtonState.approve.rawValue
                        viewModel.getMyApplyPosts(viewModel.status)
                    } label: {
                        Text("승인")
                            .bold(viewModel.status == ApplyButtonState.approve.rawValue)
                            .applyInner(
                                color:
                                    viewModel.status == ApplyButtonState.approve.rawValue ? .mainColor : .disabledTextColor
                            )
                    }
                }
                
                ZStack {
                    RoundedRectangle(cornerRadius: 15, style: .continuous)
                        .strokeBorder(viewModel.status == ApplyButtonState.reject.rawValue ? Color.main : .buttonBackground)
                        .background(viewModel.status == ApplyButtonState.reject.rawValue ? .white : .buttonBackground)
                        .cornerRadius(15)

                    Button {
                        viewModel.status = ApplyButtonState.reject.rawValue
                        viewModel.getMyApplyPosts(viewModel.status)
                    } label: {
                        Text("거절")
                            .bold(viewModel.status == ApplyButtonState.reject.rawValue)
                            .applyInner(
                                color:
                                    viewModel.status == ApplyButtonState.reject.rawValue ? .mainColor : .disabledTextColor
                            )
                    }
                }
                
                Spacer()
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

extension MyApplyPostsView {
    private func fetchMoreData(_ myPost: ApplyPostsInfoVO){
        if self.viewModel.myApplyPosts.last == myPost {
            viewModel
                .fetchMoreMyApplyPosts()
        }
    }
}
