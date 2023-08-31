//
//  LikePostRowView.swift
//  Ddungja
//
//  Created by 오승기 on 2023/08/18.
//

import SwiftUI

struct LikePostRowView: View {
    var viewModel: LikeListViewModel
    var likePost: LikeListInfoVO
    
    var body: some View {
        VStack {
            HStack(spacing: 20) {
                RemoteImage(url: likePost.thumbnailImage)
                    .frame(width: 90, height: 90)
                    .cornerRadius(6)
                    .padding(.leading)
                
                HStack {
                    VStack(alignment: .leading) {
                        HStack {
                            Image(systemName: "message")
                                .foregroundColor(.disabledText)
                            Text("10")
                                .applySubtitle(color: .mainTextColor)
                            Image(systemName: "heart")
                                .foregroundColor(.disabledText)
                            Text("\(likePost.like)")
                                .applySubtitle(color: .mainTextColor)
                        }
                        Spacer()
                        
                        Text(likePost.subCategory)
                            .applyInner(color: .mainTextColor)
                            .bold()
                        Spacer()
                        Text(likePost.name)
                            .applyInner(color: .mainTextColor)
                            .bold()
                    }
                    
                    Spacer()
                    
                    VStack {
                        Text("\(likePost.createdDate)")
                        
                        Spacer()
                        
                        ZStack(alignment: .leading) {
                            Rectangle()
                                .fill(.white)
                                .frame(height: 30)
                                .frame(width: 80)
                                .cornerRadius(6)
                            
                            Button {
                                viewModel.cancelLike(likePost.id)
                            } label: {
                                Text("취소")
                                    .applyInner(color: .mainColor)
                                    .frame(height: 30)
                                    .frame(width: 80)
                                    .cornerRadius(6)
                            }
                        }
                        .shadow(color: .gray.opacity(0.3), radius: 10, x: 0, y: 0)
                    }
                    .padding(.trailing)
                }
                .padding([.top, .bottom])
            }
            
            ZStack {
                Rectangle()
                    .fill(Color.buttonBackground)
                    .frame(height: 40)
                    .frame(maxWidth: .infinity)
                    .cornerRadius(5)
                
                HStack() {
                    
                    HStack(alignment: .center) {
                        Text("지역")
                            .applySubtitle(color: .disabledTextColor)
                        Text(likePost.region)
                            .applySubtitle(color: .mainTextColor)
                            .bold()
                    }
                    .padding()
                    
                    Divider()
                        .frame(width: 1, height: 35)
                    
                    
                    HStack(alignment: .center) {
                        Text("나이")
                            .applySubtitle(color: .disabledTextColor)
                        Text(" 개월")
                            .applySubtitle(color: .mainTextColor)
                            .bold()
                    }
                    .padding()

                    Divider()
                        .frame(width: 1, height: 35)
                    
                    HStack(alignment: .center) {
                        Text("성별")
                            .applySubtitle(color: .disabledTextColor)
                        Text(likePost.gender)
                            .applySubtitle(color: .mainTextColor)
                            .bold()
                    }
                    .padding()
                }
            }
            .padding([.leading, .trailing])
            
            Divider()
                .frame(height: 1)
                .frame(maxWidth: .infinity)
                .padding(.bottom)
        }
    }
}
