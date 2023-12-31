//
//  MyPageVIew.swift
//  Ddungja
//
//  Created by 오승기 on 2023/07/12.
//

import SwiftUI

struct MyPageScene: View {
    @StateObject private var viewModel: MyPageViewModel
    @State private var isPrivacyShow = false
    @State private var isTermShow = false
    
    private let privacySite = "https://infrequent-pufferfish-1f5.notion.site/b0dc22030a114742bc39fe0c3855f556"
    private let termsSite = "https://infrequent-pufferfish-1f5.notion.site/5c4181dc55cd4a039a671c0b24734d83"
    
    init(viewModel: MyPageViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    HStack(alignment: .center,spacing: 14) {
                        
                        RemoteImage(url: viewModel.imageURL)
                            .frame(width: 50, height: 50)
                            .clipShape(Circle())
                        
                        Text(viewModel.nickName)
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
                        .onTapGesture {
                            viewModel.push(.petRegistration(postId: nil))
                        }
                        
                        ZStack(alignment: Alignment(horizontal: .leading, vertical: .center)) {
                            Rectangle()
                                .fill(.white)
                                .frame(maxWidth: .infinity)
                                .frame(height: 54)
                                .cornerRadius(15)
                                .shadow(color: .gray.opacity(0.3), radius: 10, x: 0, y: 0)
                            
                            HStack {
                                Text(viewModel.changeProfileText())
                                    .applySubtitle(color: .mainTextColor)
                                    .bold()
                                    .padding()
                                
                                Spacer()
                                
                                Image(systemName: "plus")
                                    .foregroundColor(.main)
                                    .padding()
                            }
                        }
                        .onTapGesture {
                            viewModel.push()
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
                                        
                                        Text("\(viewModel.likeCount)")
                                            .applyInner(color: .activeTextColor)
                                            .bold()
                                    }
                                }
                                .padding()
                            }
                            .onTapGesture {
                                viewModel.push(.likeList)
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
                                        
                                        Text("\(viewModel.applyCount)")
                                            .applyInner(color: .activeTextColor)
                                            .bold()
                                    }
                                }
                                .padding()
                            }
                            .onTapGesture {
                                viewModel.push(.myApplyPosts)
                            }
                        }
                    }
                    
                    VStack(alignment: .leading, spacing: 15) {
                        HStack {
                            Image(systemName: "pencil")
                            Text("내가 작성한 게시글")
                                .applyInner(color: .mainTextColor)
                        }
                        .onTapGesture {
                            viewModel.push(.myPosts)
                        }
                        
                        HStack {
                            Image(systemName: "pencil")
                            Text("등록한 반려동물 정보")
                                .applyInner(color: .mainTextColor)
                        }
                        .onTapGesture {
                            viewModel.push(.registerScene)
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
                        HStack {
                            Image(systemName: "pencil")
                            Text("이용약관")
                                .applyInner(color: .mainTextColor)
                        }
                        .onTapGesture {
                            isTermShow = true
                        }
                        .sheet(isPresented: $isTermShow) {
                            WebView(url: termsSite)
                        }
                        
                        HStack {
                            Image(systemName: "pencil")
                            Text("제휴문의")
                                .applyInner(color: .mainTextColor)
                        }
                        
                        HStack {
                            Image(systemName: "questionmark.circle")
                            Text("회원 탈퇴")
                                .applyInner(color: .mainTextColor)
                        }
                        .onTapGesture {
                            viewModel.deleteUserInfo()
                        }
                        
                        HStack {
                            Image(systemName: "pencil")
                            Text("개인정보 처리방침")
                                .applyInner(color: .mainTextColor)
                        }
                        .onTapGesture {
                            isPrivacyShow = true
                        }
                        .sheet(isPresented: $isPrivacyShow) {
                            WebView(url: privacySite)
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
        .analyticsScreen(name: "MyPageScene")
        .alert(viewModel.errorTitle, isPresented: $viewModel.showAlert) {
            Button("확인", role: .cancel) {}
        } message: {
            Text(viewModel.errorDetailMessage)
        }
        .onAppear {
            viewModel.getMyPage()
        }
    }
}
