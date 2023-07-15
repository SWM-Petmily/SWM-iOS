//
//  MyPostsView.swift
//  Ddungja
//
//  Created by 오승기 on 2023/07/14.
//

import SwiftUI

struct MyPostsView: View {
    @ObservedObject private(set) var viewModel: MyPostsViewModel
    
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
            VStack {
                HStack {
                    Image("bulldog")
                        .frame(width: 90, height: 90)
                        .cornerRadius(6)
                    
                    HStack {
                        VStack(alignment: .leading) {
                            HStack {
                                Image(systemName: "message")
                                    .foregroundColor(.mainText)
                                Text("10")
                                    .applySubtitle(color: .mainTextColor)
                                Image(systemName: "heart")
                                    .foregroundColor(.mainText)
                                Text("10")
                                    .applySubtitle(color: .mainTextColor)
                            }
                            Spacer()
                            Text("사모예드")
                                .applyInner(color: .mainTextColor)
                            Text("아롱")
                                .applyInner(color: .mainTextColor)
                        }
                        Spacer()
                        
                        VStack {
                            Text("작성일 2023.03.31")
                                .applySubtitle(color: .mainTextColor)
                            
                            Spacer()
                            
                            ZStack(alignment: .leading) {
                                Rectangle()
                                    .fill(.white)
                                    .frame(height: 30)
                                    .frame(width: 80)
                                    .cornerRadius(6)
                                
                                Button {
                                    
                                } label: {
                                    Text("수정")
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
                            Text("서울")
                        }
                        .padding()
                        
                        Divider()
                            .frame(width: 1, height: 35)
                        
                        
                        HStack(alignment: .center) {
                            Text("나이")
                            Text("10개월")
                        }
                        .padding()

                        Divider()
                            .frame(width: 1, height: 35)
                        
                        
                        HStack(alignment: .center) {
                            Text("성별")
                            Text("남아")
                        }
                        .padding()
                        
                        
                    }
                        
                }
                .padding()
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
                    Image(systemName: "text.justify.left")
                    Image(systemName: "magnifyingglass")
                    Image(systemName: "bell")
                }
            }

        }
    }
}
