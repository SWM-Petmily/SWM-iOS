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
                .applySubtitle(color: .mainTextColor)
            
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
            .applySubtitle(color: .mainTextColor)
    }
    
    private var personStatusButton: some View {
        LazyVGrid(columns: columns){
            Button {
                buttonNumber = 1
            } label: {
                Text("학생")
                    .applyInner(color: buttonNumber == 1 ? .activeTextColor : .disabledTextColor)
                    .frame(maxWidth: .infinity, minHeight: 54)
                    .background(buttonNumber == 1 ? Color("SubColor") : Color("MainBackgroundColor"))
                    .cornerRadius(10)
            }
            
            Button {
                buttonNumber = 2
            } label: {
                Text("무직")
                    .applyInner(color: buttonNumber == 2 ? .activeTextColor : .disabledTextColor)
                    .frame(maxWidth: .infinity, minHeight: 54)
                    .background(buttonNumber == 2 ? Color("SubColor") : Color("MainBackgroundColor"))
                    .cornerRadius(10)
            }

            
            Button {
                buttonNumber = 3
            } label: {
                Text("직장인")
                    .applyInner(color: buttonNumber == 3 ? .activeTextColor : .disabledTextColor)
                    .frame(maxWidth: .infinity, minHeight: 54)
                    .background(buttonNumber == 3 ? Color("SubColor") : Color("MainBackgroundColor"))
                    .cornerRadius(10)
            }
        }
    }
    
    private var experienceTitle: some View {
        Text("반려동물 경험")
            .applySubtitle(color: .mainTextColor)
    }
    
    private var experienceButton: some View {
        LazyVGrid(columns: experienceColumns) {
            Button {
                experienceNumber = 1
            } label: {
                Text("있음")
                    .applyInner(color: experienceNumber == 1 ? .activeTextColor : .disabledTextColor)
                    .frame(maxWidth: .infinity, minHeight: 54)
                    .background(experienceNumber == 1 ? Color("SubColor") : Color("MainBackgroundColor"))
                    .cornerRadius(10)
            }
            
            Button {
                experienceNumber = 2
            } label: {
                Text("없음")
                    .applyInner(color: experienceNumber == 2 ? .activeTextColor : .disabledTextColor)
                    .frame(maxWidth: .infinity, minHeight: 54)
                    .background(experienceNumber == 2 ? Color("SubColor") : Color("MainBackgroundColor"))
                    .cornerRadius(10)
            }
        }
    }
    
    private var selectSpeciesTitle: some View {
        Text("반려동물 종을 선택해주세요")
            .applySubtitle(color: .mainTextColor)
    }
    
    private var houseTitle: some View {
        Text("주거환경")
            .applySubtitle(color: .mainTextColor)
    }
    
    private var houseButton: some View {
        LazyVGrid(columns: houseColumns) {
            Button {
                houseNumber = 1
            } label: {
                Text("원룸")
                    .applyInner(color: houseNumber == 1 ? .activeTextColor : .disabledTextColor)
                    .frame(maxWidth: .infinity, minHeight: 54)
                    .background(houseNumber == 1 ? Color("SubColor") : Color("MainBackgroundColor"))
                    .cornerRadius(10)
            }
            
            Button {
                houseNumber = 2
            } label: {
                Text("아파트")
                    .applyInner(color: houseNumber == 2 ? .activeTextColor : .disabledTextColor)
                    .frame(maxWidth: .infinity, minHeight: 54)
                    .background(houseNumber == 2 ? Color("SubColor") : Color("MainBackgroundColor"))
                    .cornerRadius(10)
            }
            
            Button {
                houseNumber = 3
            } label: {
                Text("오피스텔\n빌라")
                    .applyInner(color: houseNumber == 3 ? .activeTextColor : .disabledTextColor)
                    .frame(maxWidth: .infinity, minHeight: 54)
                    .background(houseNumber == 3 ? Color("SubColor") : Color("MainBackgroundColor"))
                    .cornerRadius(10)
            }
            
            Button {
                houseNumber = 4
            } label: {
                Text("단독주택")
                    .applyInner(color: houseNumber == 4 ? .activeTextColor : .disabledTextColor)
                    .frame(maxWidth: .infinity, minHeight: 54)
                    .background(houseNumber == 4 ? Color("SubColor") : Color("MainBackgroundColor"))
                    .cornerRadius(10)
            }
        }
    }
    
    private var personTitle: some View {
        Text("함께 거주하는 인원")
            .applySubtitle(color: .mainTextColor)
    }
    
    private var personButton: some View {
        HStack(spacing: 10) {
            Button {
                if(person >= 1) { person -= 1 }
            } label: {
                Text("-")
                    .applyInner(color: .disabledTextColor)
                    .frame(width: 54, height: 54)
                    .background(Color("MainBackgroundColor"))
                    .cornerRadius(10)
            }
            
            ZStack {
                Rectangle()
                    .fill(Color("MainBackgroundColor"))
                    
                    
                Text("\(person)")
                    .background(Color("MainBackgroundColor"))
            }
            .frame(height: 54)
            .cornerRadius(10)
        
            Button {
                person += 1
            } label: {
                Text("+")
                    .applyInner(color: .disabledTextColor)
                    .frame(width: 54, height: 54)
                    .background(Color("MainBackgroundColor"))
                    .cornerRadius(10)
            }
        }
    }
    
    private var willTitle: some View {
        Text("키울 수 있는 각오")
            .applySubtitle(color: .mainTextColor)
    }
    
    private var willTextfield: some View {
        ZStack(alignment: Alignment(horizontal: .leading, vertical: .top)) {
            TextField("진정성 있는 각오를 작성해주세요", text: $willString, axis: .vertical)
                .frame(maxWidth: .infinity, minHeight: 186, alignment: .topLeading)
                .padding()
                .background(Color("MainBackgroundColor"))
                .cornerRadius(10)
        }
    }
    
    private var openKakaoLink: some View {
        Text("오픈 카톡방 링크")
            .applySubtitle(color: .mainTextColor)
    }
    
    private var openKakaoTextfield: some View {
        ZStack(alignment: Alignment(horizontal: .leading, vertical: .top)) {
            TextField("링크를 붙여주세요", text: $kakaoLinkString, axis: .vertical)
                .frame(maxWidth: .infinity,alignment: .center)
                .frame(height: 30)
                .font(.system(size: 22))
                .padding()
                .background(Color("MainBackgroundColor"))
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
