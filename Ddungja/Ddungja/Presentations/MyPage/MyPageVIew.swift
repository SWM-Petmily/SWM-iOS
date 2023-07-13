//
//  MyPageVIew.swift
//  Ddungja
//
//  Created by 오승기 on 2023/07/12.
//

import SwiftUI

struct MyPageVIew: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    HStack(alignment: .center,spacing: 14) {
                        ZStack {
                            Circle()
                                .fill(.gray)
                                .frame(width: 53, height: 53)
                            Image("bulldog")
                                .resizable()
                                .frame(width: 34, height: 34)
                        }
                
                        Text("아롱")
                            .font(.title)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    
                    VStack {
                        ZStack(alignment: Alignment(horizontal: .leading, vertical: .center)) {
                            Rectangle()
                                .fill(.white)
                                .frame(maxWidth: .infinity)
                                .frame(height: 54)
                                .cornerRadius(15)
                                .shadow(color: .gray.opacity(0.3), radius: 10, x: 0, y: 0)
                            
                            HStack {
                                Text("내 반려동물 등록하기")
                                    .applySubtitle(color: .mainTextColor)
                                    .bold()
                                    .padding()
                                
                                Spacer()
                                
                                Image(systemName: "plus")
                                    .foregroundColor(.main)
                                    .padding()
                            }
                        }
                        
                        ZStack(alignment: Alignment(horizontal: .leading, vertical: .center)) {
                            Rectangle()
                                .fill(.white)
                                .frame(maxWidth: .infinity)
                                .frame(height: 54)
                                .cornerRadius(15)
                                .shadow(color: .gray.opacity(0.3), radius: 10, x: 0, y: 0)
                            
                            HStack {
                                Text("프로필 보기")
                                    .applySubtitle(color: .mainTextColor)
                                    .bold()
                                    .padding()
                                
                                Spacer()
                                
                                Image(systemName: "plus")
                                    .foregroundColor(.main)
                                    .padding()
                            }
                        }
                    }
                    
                    VStack(alignment: .leading) {
                        Text("내 정보")
                            .applySubtitle(color: .mainTextColor)
                        
                        CustomLazyVGrid(col: 2, spacing: 10) {
                            ZStack(alignment: .leading) {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 15)
                                        .fill(.white)
                                    RoundedRectangle(cornerRadius: 15)
                                        .stroke(Color.buttonBackground, lineWidth: 1)
                                }
                                .frame(maxWidth: .infinity)
                                .frame(height: 106)
                                
                                VStack(alignment: .leading) {
                                    Image(systemName: "heart")
                                        .frame(width: 24, height: 24)
                                        
                                    HStack {
                                        Text("관심목록")
                                            .applyInner(color: .mainTextColor)
                                            .bold()
                                        
                                        Spacer()
                                        
                                        Text("24")
                                            .applyInner(color: .activeTextColor)
                                            .bold()
                                    }
                                }
                                .padding()
                            }
                            
                            ZStack(alignment: .leading) {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 15)
                                        .fill(.white)
                                    RoundedRectangle(cornerRadius: 15)
                                        .stroke(Color.buttonBackground, lineWidth: 1)
                                }
                                .frame(maxWidth: .infinity)
                                .frame(height: 106)
                                
                                VStack(alignment: .leading) {
                                    Image(systemName: "heart.text.square")
                                        .frame(width: 24, height: 24)
                                        
                                    HStack {
                                        Text("지원내역")
                                            .applyInner(color: .mainTextColor)
                                            .bold()
                                        
                                        Spacer()
                                        
                                        Text("24")
                                            .applyInner(color: .activeTextColor)
                                            .bold()
                                    }
                                }
                                .padding()
                            }
                        }
                    }
                    
                    VStack(alignment: .leading, spacing: 15) {
                        HStack {
                            Image(systemName: "pencil")
                            Text("내가 작성한 게시글")
                                .applyInner(color: .mainTextColor)
                        }
                        
                        HStack {
                            Image(systemName: "pencil")
                            Text("등록한 반려동물 정보")
                                .applyInner(color: .mainTextColor)
                        }
                        
                        HStack {
                            Image(systemName: "pencil")
                            Text("알림설정")
                                .applyInner(color: .mainTextColor)
                        }
                        
                        HStack {
                            Image(systemName: "exclamationmark.circle")
                            Text("신고내역")
                                .applyInner(color: .mainTextColor)
                        }
                    }
                    
                    Divider()
                        .frame(height: 4)
                    
                    VStack(alignment: .leading, spacing: 15) {
                        Text("고객센터")
                            .applySubtitle(color: .mainTextColor)
                        HStack {
                            Image(systemName: "pencil")
                            Text("고객센터")
                                .applyInner(color: .mainTextColor)
                        }
                        
                        HStack {
                            Image(systemName: "pencil")
                            Text("제휴문의")
                                .applyInner(color: .mainTextColor)
                        }
                        
                        HStack {
                            Image(systemName: "questionmark.circle")
                            Text("자주 물어보는 질문")
                                .applyInner(color: .mainTextColor)
                        }
                        
                        HStack {
                            Image(systemName: "pencil")
                            Text("개인전보 처리방침")
                                .applyInner(color: .mainTextColor)
                        }
                    }
                }
                .padding()
            }
            .navigationTitle("마이페이지")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Image(systemName: "gearshape")
                }
            }
        }
    }
}

struct MyPageVIew_Previews: PreviewProvider {
    static var previews: some View {
        MyPageVIew()
    }
}
