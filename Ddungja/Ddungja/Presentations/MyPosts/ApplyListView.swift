//
//  ApplyListView.swift
//  Ddungja
//
//  Created by 오승기 on 2023/07/20.
//

import SwiftUI

struct ApplyListView: View {
    var viewModel: MyPostsViewModel
    
    var body: some View {
        ScrollView {
            LazyVStack {
//                ForEach(viewModel.
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
            
        }
        .onTapGesture {
            print("cell tapped")
        }
        .padding()
    }
}

extension ApplyListView {
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
