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
                            viewModel.moveToDetaionApply(id: info.applyId)
                        }
                }
            }
        }
        .navigationTitle("지원 받은 목록")
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Text("작성한 분양글")
                    .onTapGesture {
                        viewModel.pop()
                    }
            }
        }
        .onAppear {
            viewModel.getApplyList(id: postId)
        }
        .padding()
    }
}

extension ApplyListScene {
    private var userTitle: some View {
        HStack(spacing: 14) {
            ZStack {
                Circle()
                    .fill(.gray)
                    .frame(width: 68, height: 68)
                Image("bulldog")
                    .resizable()
                    .frame(width: 50, height: 50)
            }
            
            VStack(alignment: .leading, spacing: 4) {
                HStack(alignment: .center, spacing: 7) {
                    Text("아롱")
                        .applyTitle(color: .mainTextColor)
                        .bold()
                    ZStack {
                        RoundedRectangle(cornerRadius: 25, style: .continuous)
                            .stroke(Color.gray, lineWidth: 1)
                            .frame(width: 53, height: 25)
                        
                        Text("직장인")
                            .applySubtitle(color: .disabledTextColor)
                    }
                }
                Text("대한민국, 서울")
                    .applySubtitle(color: .disabledTextColor)
                
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var userInfo: some View {
        CustomLazyVGrid(col: 3, spacing: 10) {
            ZStack(alignment: .leading) {
                Rectangle()
                    .fill(.white)
                    .frame(maxWidth: .infinity, minHeight: 77)
                    .cornerRadius(15)
                
                VStack(alignment: .leading, spacing: 10) {
                    Text("양육 경험")
                        .applySubtitle(color: .disabledTextColor)
                    Text("없음")
                        .applyInner(color: .mainTextColor)
                        .bold()
                }
                .padding()
            }
                    
            ZStack(alignment: .leading) {
                Rectangle()
                    .fill(.white)
                    .frame(maxWidth: .infinity, minHeight: 77)
                    .cornerRadius(15)
                
                VStack(alignment: .leading, spacing: 10) {
                    Text("주거환경")
                        .applySubtitle(color: .disabledTextColor)
                    Text("오피스텔")
                        .applyInner(color: .mainTextColor)
                        .bold()
                }
                .padding()
            }
            
            ZStack(alignment: .leading) {
                Rectangle()
                    .fill(.white)
                    .frame(maxWidth: .infinity, minHeight: 77)
                    .cornerRadius(15)
                
                VStack(alignment: .leading, spacing: 10) {
                    Text("가족 수")
                        .applySubtitle(color: .disabledTextColor)
                    Text("5 명")
                        .applyInner(color: .mainTextColor)
                        .bold()
                }
                .padding()
            }
        }
    }
}

extension ApplyListScene {
    private func fetchMoreApplyListData(_ applyList: ApplyListInfoVO, _ postId: Int){
        if self.viewModel.applyLists.last == applyList {
            viewModel.fetchMoreApplyList(id: postId)
        }
    }
}
