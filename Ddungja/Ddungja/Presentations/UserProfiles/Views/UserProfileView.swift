//
//  UserProfileView.swift
//  Ddungja
//
//  Created by 오승기 on 2023/07/02.
//

import SwiftUI

struct UserProfileView: View {
    
    @State var input = ""
    private let columns: [GridItem] = [
        GridItem(.flexible(), spacing: 10),
        GridItem(.flexible(), spacing: 10),
    ]
    
    var body: some View {
        
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
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Text("수정하기")
                    .foregroundColor(Color.orange)
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
                Image("bulldog")
                    .resizable()
                    .frame(width: 50, height: 50)
            }
            
            VStack(spacing: 4) {
                HStack(spacing: 7) {
                    Text("아롱")
                        .font(.system(size: 18))
                        .bold()
                    ZStack {
                        RoundedRectangle(cornerRadius: 25, style: .continuous)
                            .stroke(Color.gray, lineWidth: 1)
                            .frame(width: 53, height: 28)
                        
                        Text("직장인")
                            .font(.system(size: 14))
                    }
                }
                Text("대한민국, 서울")
                    .font(.system(size: 14))
                
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var basicInfoTitle: some View {
        Text("기본정보")
            .font(.system(size: 14))
            .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var basicInfoGrid: some View {
        LazyVGrid(columns: columns, spacing: 10) {
            ZStack(alignment: .leading) {
                Rectangle()
                    .fill(.white)
                    .frame(maxWidth: .infinity, minHeight: 77)
                    .cornerRadius(15)
                
                VStack(alignment: .leading, spacing: 10) {
                    Text("반려 동물 경험")
                        .foregroundColor(Color.gray)
                        .font(.system(size: 14))
                    Text("있음")
                        .font(.system(size: 16))
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
                        .foregroundColor(Color.gray)
                        .font(.system(size: 14))
                    Text("푸들")
                        .font(.system(size: 16))
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
                        .foregroundColor(Color.gray)
                        .font(.system(size: 14))
                    Text("아파트")
                        .font(.system(size: 16))
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
                        .foregroundColor(Color.gray)
                        .font(.system(size: 14))
                    Text("3명")
                        .font(.system(size: 16))
                }
                .padding()
            }
        }
        .shadow(color: .gray.opacity(0.3), radius: 10, x: 0, y: 0)
    }
    
    private var willAndLinkTitle: some View {
        Text("각오 및 링크")
            .font(.system(size: 14))
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
                    .foregroundColor(Color.gray)
                    .font(.system(size: 14))
            
                Text("내용을 적어주세요")
                    .font(.system(size: 16))
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
                    .foregroundColor(Color.gray)
                    .font(.system(size: 14))
            
                Text("https://open.kakaotalk/o/gfVqxt6c")
                    .font(.system(size: 16))
            }
            .padding()
        }
    }
}

struct UserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileView()
    }
}
