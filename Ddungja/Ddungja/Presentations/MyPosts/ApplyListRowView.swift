//
//  ApplyListRowView.swift
//  Ddungja
//
//  Created by 오승기 on 2023/07/21.
//

import SwiftUI

struct ApplyListRowView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15, style: .continuous)
                .strokeBorder(.gray, lineWidth: 1)
                .background(.white)
                .frame(height: 300)
                .frame(maxWidth: .infinity)
                
            VStack {
                userTitle
                
                Divider()
                
                userInfo
                
                Text("처음이지만 열심히 공부하고 있어요")
                    .applySubtitle(color: .mainTextColor)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    .lineLimit(1)
                    .frame(height: 45)
                    .background(Color.buttonBackground)
                    .cornerRadius(15)
                
                CustomLazyVGrid(col: 2, spacing: 10) {
                    Button {
                        print("거절 tapped")
                    } label: {
                        Text("거절")
                            .makeRejectButton()
                    }
                    
                    Button {
                        print("수락 tapped")
                    } label: {
                        Text("수락")
                            .makeAcceptButton()
                    }
                }
            }
            .padding()
        }
    }
}

extension ApplyListRowView {
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
