//
//  EditProfile.swift
//  Ddungja
//
//  Created by 오승기 on 2023/07/03.
//

import SwiftUI

struct EditProfile: View {
    
    @State private var buttonNumber = 1
    @State private var experienceNumber = 1
    @State private var houseNumber = 1
    @State private var person = 1
    @State private var willString = ""
    @State private var kakaoLinkString = ""
    
    private let columns: [GridItem] = [
        GridItem(.flexible(), spacing: 10),
        GridItem(.flexible(), spacing: 10),
        GridItem(.flexible(), spacing: 10),
    ]
    
    private let experienceColumns: [GridItem] = [
        GridItem(.flexible(), spacing: 10),
        GridItem(.flexible(), spacing: 10)
    ]
    
    private let houseColumns: [GridItem] = [
        GridItem(.flexible(), spacing: 10),
        GridItem(.flexible(), spacing: 10),
        GridItem(.flexible(), spacing: 10),
        GridItem(.flexible(), spacing: 10),
    ]
    
    var body: some View {
        
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Group {
//                    profileImageTitle
                    profileImageView
                    
                    personStatusTitle
                    personStatusButton
                    
                    experienceTitle
                    experienceButton
                }
                
                if(experienceNumber == 1) {
                    selectSpeciesTitle
                    Rectangle()
                        .frame(width: 200, height: 200)
                }
                
                Group {
                    houseTitle
                    houseButton
                    
                    personTitle
                    personButton
                    
                    willTitle
                    willTextfield
                    
                    openKakaoLink
                    openKakaoTextfield
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
        }
        
        registerButton
    }
}

extension EditProfile {
    private var profileImageView: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("프로필 사진")
                .foregroundColor(Color.gray)
                .font(.system(size: 14))
            
            HStack {
                ZStack {
                    Circle()
                        .fill(.gray)
                        .frame(width: 68, height: 68)
                    Image("bulldog")
                        .resizable()
                        .frame(width: 50, height: 50)
                }
                
                ZStack {
                    Circle()
                        .fill(.yellow)
                        .frame(width: 68, height: 68)
                    Image("dog1")
                        .resizable()
                        .frame(width: 50, height: 50)
                }
                
                ZStack {
                    Circle()
                        .fill(.cyan)
                        .frame(width: 68, height: 68)
                    Image("dog2")
                        .resizable()
                        .frame(width: 50, height: 50)
                }
                
                ZStack {
                    Circle()
                        .fill(.orange)
                        .frame(width: 68, height: 68)
                    Image("poodle")
                        .resizable()
                        .frame(width: 50, height: 50)
                }
            }
        }
    }
    
    private var personStatusTitle: some View {
        Text("신분")
            .foregroundColor(Color.gray)
            .font(.system(size: 14))
    }
    
    private var personStatusButton: some View {
        LazyVGrid(columns: columns){
            Button {
                buttonNumber = 1
            } label: {
                Text("학생")
                    .frame(maxWidth: .infinity, minHeight: 54)
                    .foregroundColor(buttonNumber == 1 ? .gray : .orange)
                    .background(buttonNumber == 1 ? .orange : .gray)
                    .cornerRadius(10)
            }
            
            Button {
                buttonNumber = 2
            } label: {
                Text("무직")
                    .frame(maxWidth: .infinity, minHeight: 54)
                    .foregroundColor(buttonNumber == 2 ? .gray : .orange)
                    .background(buttonNumber == 2 ? .orange : .gray)
                    .cornerRadius(10)
            }

            
            Button {
                buttonNumber = 3
            } label: {
                Text("직장인")
                    .frame(maxWidth: .infinity, minHeight: 54)
                    .foregroundColor(buttonNumber == 3 ? .gray : .orange)
                    .background(buttonNumber == 3 ? .orange : .gray)
                    .cornerRadius(10)
            }
        }
    }
    
    private var experienceTitle: some View {
        Text("반려동물 경험")
            .foregroundColor(Color.gray)
            .font(.system(size: 14))
    }
    
    private var experienceButton: some View {
        LazyVGrid(columns: experienceColumns) {
            Button {
                experienceNumber = 1
            } label: {
                Text("있음")
                    .frame(maxWidth: .infinity, minHeight: 54)
                    .foregroundColor(experienceNumber == 1 ? .gray : .orange)
                    .background(experienceNumber == 1 ? .orange : .gray)
                    .cornerRadius(10)
            }
            
            Button {
                experienceNumber = 2
            } label: {
                Text("없음")
                    .frame(maxWidth: .infinity, minHeight: 54)
                    .foregroundColor(experienceNumber == 2 ? .gray : .orange)
                    .background(experienceNumber == 2 ? .orange : .gray)
                    .cornerRadius(10)
            }
        }
    }
    
    private var selectSpeciesTitle: some View {
        Text("반려동물 종을 선택해주세요")
            .foregroundColor(Color.gray)
            .font(.system(size: 14))
    }
    
    private var houseTitle: some View {
        Text("주거환경")
            .foregroundColor(Color.gray)
            .font(.system(size: 14))
    }
    
    private var houseButton: some View {
        LazyVGrid(columns: houseColumns) {
            Button {
                houseNumber = 1
            } label: {
                Text("원룸")
                    .frame(maxWidth: .infinity, minHeight: 54)
                    .foregroundColor(houseNumber == 1 ? .gray : .orange)
                    .background(houseNumber == 1 ? .orange : .gray)
                    .cornerRadius(10)
            }
            
            Button {
                houseNumber = 2
            } label: {
                Text("아파트")
                    .frame(maxWidth: .infinity, minHeight: 54)
                    .foregroundColor(houseNumber == 2 ? .gray : .orange)
                    .background(houseNumber == 2 ? .orange : .gray)
                    .cornerRadius(10)
            }
            
            Button {
                houseNumber = 3
            } label: {
                Text("오피스텔\n빌라")
                    .frame(maxWidth: .infinity, minHeight: 54)
                    .foregroundColor(houseNumber == 3 ? .gray : .orange)
                    .background(houseNumber == 3 ? .orange : .gray)
                    .cornerRadius(10)
            }
            
            Button {
                houseNumber = 4
            } label: {
                Text("단독주택")
                    .frame(maxWidth: .infinity, minHeight: 54)
                    .foregroundColor(houseNumber == 4 ? .gray : .orange)
                    .background(houseNumber == 4 ? .orange : .gray)
                    .cornerRadius(10)
            }
        }
    }
    
    private var personTitle: some View {
        Text("함께 거주하는 인원")
            .foregroundColor(Color.gray)
            .font(.system(size: 14))
    }
    
    private var personButton: some View {
        HStack(spacing: 10) {
            Button {
                if(person >= 1) { person -= 1 }
            } label: {
                Text("-")
                    .frame(width: 54, height: 54)
                    .foregroundColor(experienceNumber == 2 ? .gray : .orange)
                    .background(experienceNumber == 2 ? .orange : .gray)
                    .cornerRadius(10)
            }
            
            ZStack {
                Rectangle()
                    .fill(.gray)
                    
                    
                Text("\(person)")
                    .background(.gray)
            }
            .frame(height: 54)
            .cornerRadius(10)
        
            Button {
                person += 1
            } label: {
                Text("+")
                    .frame(width: 54, height: 54)
                    .foregroundColor(experienceNumber == 2 ? .gray : .orange)
                    .background(experienceNumber == 2 ? .orange : .gray)
                    .cornerRadius(10)
            }
        }
    }
    
    private var willTitle: some View {
        Text("키울 수 있는 각오")
            .foregroundColor(Color.gray)
            .font(.system(size: 14))
    }
    
    private var willTextfield: some View {
        ZStack(alignment: Alignment(horizontal: .leading, vertical: .top)) {
            TextField("진정성 있는 각오를 작성해주세요", text: $willString, axis: .vertical)
                .frame(maxWidth: .infinity, minHeight: 186, alignment: .topLeading)
                .padding()
                .background(Color.gray)
                .cornerRadius(10)
        }
    }
    
    private var openKakaoLink: some View {
        Text("오픈 카톡방 링크")
            .foregroundColor(Color.gray)
            .font(.system(size: 14))
    }
    
    private var openKakaoTextfield: some View {
        ZStack(alignment: Alignment(horizontal: .leading, vertical: .top)) {
            TextField("링크를 붙여주세요", text: $kakaoLinkString, axis: .vertical)
                .frame(maxWidth: .infinity,alignment: .center)
                .frame(height: 30)
                .font(.system(size: 22))
                .padding()
                .background(Color.gray)
                .cornerRadius(10)
        }
    }
    
    private var registerButton: some View {
        Button {
            //모달 sheet올리기
        } label: {
            Text("등록")
        }
        .frame(height: 52)
        .frame(maxWidth: .infinity)
        .background(Color.orange)
        .cornerRadius(14)
        .padding(.trailing)
        .padding(.bottom)
        .padding(.leading)
    }
}

struct EditProfile_Previews: PreviewProvider {
    static var previews: some View {
        EditProfile()
    }
}
