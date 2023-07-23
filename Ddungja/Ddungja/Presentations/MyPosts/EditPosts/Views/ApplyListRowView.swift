//
//  ApplyListRowView.swift
//  Ddungja
//
//  Created by 오승기 on 2023/07/21.
//

import SwiftUI

struct ApplyListRowView: View {
    var viewModel: MyPostsViewModel
    var vo: ApplyListInfoVO
    
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
                
                Text(vo.comment)
                    .applySubtitle(color: .mainTextColor)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    .lineLimit(1)
                    .frame(height: 45)
                    .background(Color.buttonBackground)
                    .cornerRadius(15)
                
                CustomLazyVGrid(col: 2, spacing: 10) {
                    Button {
                        throttleButton(id: vo.applyId, approval: "REJECTED")
                    } label: {
                        Text("거절")
                            .makeRejectButton()
                    }
                    
                    Button {
                        throttleButton(id: vo.applyId, approval: "APPROVED")
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
                    Text(vo.nickname)
                        .applyTitle(color: .mainTextColor)
                        .bold()
                    ZStack {
                        RoundedRectangle(cornerRadius: 25, style: .continuous)
                            .stroke(Color.gray, lineWidth: 1)
                            .frame(width: 53, height: 25)
                        
                        Text(vo.job)
                            .applySubtitle(color: .disabledTextColor)
                    }
                }
                Text("대한민국, \(vo.region)")
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
                    Text(vo.isExperience ? "있음" : "없음")
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
                    Text(vo.environment)
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
                    Text("\(vo.people) 명")
                        .applyInner(color: .mainTextColor)
                        .bold()
                }
                .padding()
            }
        }
    }
}

extension ApplyListRowView {
    private func throttleButton(id: Int, approval: String) {
        viewModel.touchEvent.send((id, approval))
    }
}
