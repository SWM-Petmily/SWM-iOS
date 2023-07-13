//
//  UserProfileView.swift
//  Ddungja
//
//  Created by 오승기 on 2023/07/02.
//

import SwiftUI

struct UserProfileView: View {
    
    @State var input = ""
    
    @ObservedObject var viewModel: UserProfileViewModel
    private var profile: ProfileVO {
        viewModel.profile
    }
    
    init(viewModel: UserProfileViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                userTitle
                
                basicInfoTitle
                basicInfoGrid
                
                willAndLinkTitle
                willTextField
                openChatLink
                
                Spacer()
            }
            .padding()
            .navigationBarTitleDisplayMode(.inline)
        }
        .navigationTitle("프로필")
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Text("마이페이지")
                    .onTapGesture {
                        viewModel.pop()
                    }
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Text("수정하기")
                    .applyInner(color: .mainColor)
                    .onTapGesture {
                        viewModel.moveToEditProfile()
                    }
            }
        }
    }
}

extension UserProfileView {
    private var userTitle: some View {
        HStack(spacing: 14) {
            ZStack {
                Circle()
                    .fill(.gray)
                    .frame(width: 68, height: 68)
                Image(profile.profileImage)
                    .resizable()
                    .frame(width: 50, height: 50)
            }
            
            VStack(alignment: .leading, spacing: 4) {
                HStack(alignment: .center, spacing: 7) {
                    Text(viewModel.profile.nickname)
                        .applyTitle(color: .mainTextColor)
                        .bold()
                    ZStack {
                        RoundedRectangle(cornerRadius: 25, style: .continuous)
                            .stroke(Color.gray, lineWidth: 1)
                            .frame(width: 53, height: 25)
                        
                        Text(viewModel.profile.job)
                            .applySubtitle(color: .disabledTextColor)
                    }
                }
                Text("대한민국, \(profile.region)")
                    .applySubtitle(color: .disabledTextColor)
                
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var basicInfoTitle: some View {
        Text("기본정보")
            .applySubtitle(color: .mainTextColor)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var basicInfoGrid: some View {
        CustomLazyVGrid(col: 2, spacing: 10) {
            ZStack(alignment: .leading) {
                Rectangle()
                    .fill(.white)
                    .frame(maxWidth: .infinity, minHeight: 77)
                    .cornerRadius(15)
                
                VStack(alignment: .leading, spacing: 10) {
                    Text("반려 동물 경험")
                        .applySubtitle(color: .disabledTextColor)
                    Text((profile.isExperience) ? "있음" : "없음")
                        .applyInner(color: .mainTextColor)
                }
                .padding()
            }
    
            ZStack(alignment: .leading) {
                Rectangle()
                    .fill(.white)
                    .frame(maxWidth: .infinity, minHeight: 77)
                    .cornerRadius(15)
                
                VStack(alignment: .leading, spacing: 10) {
                    Text("반려 동물 종")
                        .applySubtitle(color: .disabledTextColor)
                    Text(profile.experiences.first?.species ?? "-")
                        .applyInner(color: .mainTextColor)
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
                    Text(profile.environment)
                        .applyInner(color: .mainTextColor)
                }
                .padding()
            }
            
            ZStack(alignment: .leading) {
                Rectangle()
                    .fill(.white)
                    .frame(maxWidth: .infinity, minHeight: 77)
                    .cornerRadius(15)
                
                VStack(alignment: .leading, spacing: 10) {
                    Text("함께하는 사람 수")
                        .applySubtitle(color: .disabledTextColor)
                    Text("\(profile.people) 명")
                        .applyInner(color: .mainTextColor)
                }
                .padding()
            }
        }
        .shadow(color: .gray.opacity(0.3), radius: 10, x: 0, y: 0)
    }
    
    private var willAndLinkTitle: some View {
        Text("각오 및 링크")
            .applySubtitle(color: .mainTextColor)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var willTextField: some View {
        
        ZStack(alignment: Alignment(horizontal: .leading, vertical: .top)) {
            Rectangle()
                .fill(.white)
                .frame(maxWidth: .infinity,minHeight: 122, maxHeight: 122)
                .cornerRadius(15)
                .shadow(color: .gray.opacity(0.3), radius: 10, x: 0, y: 0)
            
            
            VStack(alignment: .leading, spacing: 10) {
                Text("키울 수 있는 각오")
                    .applySubtitle(color: .disabledTextColor)
            
                Text(profile.comment)
                    .applyInner(color: .mainTextColor)
            }
            .padding()
        }
    }
    
    private var openChatLink: some View {
        ZStack(alignment: .leading) {
            Rectangle()
                .fill(.white)
                .frame(maxWidth: .infinity, minHeight: 77, maxHeight: 77)
                .cornerRadius(15)
                .shadow(color: .gray.opacity(0.3), radius: 10, x: 0, y: 0)
            
            VStack(alignment: .leading, spacing: 10) {
                Text("오픈 카톡방 링크")
                    .applySubtitle(color: .disabledTextColor)
            
                Text(profile.openTalk)
                    .applyInner(color: .mainTextColor)
                    .lineLimit(1)
            }
            .padding()
        }
    }
}

//struct UserProfileView_Previews: PreviewProvider {
//    static var previews: some View {
//        UserProfileView()
//    }
//}
