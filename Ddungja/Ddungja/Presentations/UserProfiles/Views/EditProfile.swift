//
//  EditProfile.swift
//  Ddungja
//
//  Created by 오승기 on 2023/07/03.
//

import SwiftUI

struct EditProfile: View {
    
    @State private var imageNumer: ImageStatus = .bulldog
    @State private var jobStatus: EmploymentStatus
    @State private var experienceNumber: ExperienceStatus
    @State private var houseNumber: HouseStatus
    @State private var person = 1
    @State private var willString: String
    @State private var kakaoLinkString: String
    
    @State private var isShowSheet = false
    
    @ObservedObject var viewModel: UserProfileViewModel
    
    init(viewModel: UserProfileViewModel) {
        self.viewModel = viewModel
        
        jobStatus = viewModel.changeToJobStatus(viewModel.profile.job)
        experienceNumber = viewModel.changeToExperience(viewModel.profile.isExperience)
        houseNumber = viewModel.changeToHomeStatus(viewModel.profile.environment)
        person = viewModel.profile.people
        willString = viewModel.profile.comment
        kakaoLinkString = viewModel.profile.openTalk
    }
    
    var body: some View {
        
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Group {
                    profileImageView
                    
                    personStatusTitle
                    personStatusButton
                    
                    experienceTitle
                    experienceButton
                }
                
                if(experienceNumber == .yes) {
                    selectSpeciesTitle
                    
                    LazyVStack {
                        ForEach(viewModel.experienceArray.indices, id: \.self) { index in
                            ExperienceRow(id: viewModel.experienceArray[index].id, species: viewModel.experienceArray[index].species, year: String(viewModel.experienceArray[index].period / 12), month: String(viewModel.experienceArray[index].period % 12), viewModel: viewModel).id(UUID())
                        }
                        .transition(AnyTransition.opacity.animation(.easeInOut))
                    }
                    
                    Button {
                        withAnimation {
                            viewModel.experienceArray.append((id: UUID(), species: "", period: 0))
                        }
                    } label: {
                        Text("추가")
                            .applyInner(color: .white)
                            .frame(height: 52)
                            .frame(maxWidth: .infinity)
                    }
                    .background(Color.main)
                    .cornerRadius(14)
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
            .navigationTitle("프로필 작성")
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
                        .fill(.yellow)
                        .frame(width: 68, height: 68)
                        .overlay(
                            imageNumer.rawValue == 1 ?
                            Circle().stroke(Color.orange,lineWidth: 2) :
                                Circle().stroke(Color.orange,lineWidth: 0)
                        )
                    Image("bulldog")
                        .resizable()
                        .frame(width: 50, height: 50, alignment: .center)
                }
                .onTapGesture {
                    imageNumer = .bulldog
                }
                ZStack {
                    Circle()
                        .fill(.gray)
                        .frame(width: 68, height: 68)
                        .overlay(
                            imageNumer.rawValue == 2 ?
                            Circle().stroke(Color.orange,lineWidth: 2) :
                                Circle().stroke(Color.orange,lineWidth: 0)
                        )
                    Image("dog1")
                        .resizable()
                        .frame(width: 50, height: 50)
                }
                .onTapGesture {
                    imageNumer = .dog1
                }
                
                ZStack {
                    Circle()
                        .fill(.cyan)
                        .frame(width: 68, height: 68)
                        .overlay(
                            imageNumer.rawValue == 3 ?
                            Circle().stroke(Color.orange,lineWidth: 2) :
                                Circle().stroke(Color.orange,lineWidth: 0)
                        )
                    Image("dog2")
                        .resizable()
                        .frame(width: 50, height: 50)
                }
                .onTapGesture {
                    imageNumer = .dog2
                }
                
                ZStack {
                    Circle()
                        .fill(.orange)
                        .frame(width: 68, height: 68)
                        .overlay(
                            imageNumer.rawValue == 4 ?
                            Circle().stroke(Color.orange,lineWidth: 2) :
                                Circle().stroke(Color.orange,lineWidth: 0)
                        )
                    Image("poodle")
                        .resizable()
                        .frame(width: 50, height: 50)
                }
                .onTapGesture {
                    imageNumer = .poodle
                }
            }
        }
    }
    
    private var personStatusTitle: some View {
        Text("신분")
            .applySubtitle(color: .mainTextColor)
    }
    
    private var personStatusButton: some View {
        CustomLazyVGrid(col: 3, spacing: 10) {
            Button {
                jobStatus = .student
            } label: {
                Text("학생")
                    .applyInner(color: jobStatus == .student ? .activeTextColor : .disabledTextColor)
                    .frame(maxWidth: .infinity, minHeight: 54)
                    .background(jobStatus == .student ? Color.sub : Color.mainBackground)
                    .cornerRadius(10)
            }
            
            Button {
                jobStatus = .unemployed
            } label: {
                Text("무직")
                    .applyInner(color: jobStatus == .unemployed ? .activeTextColor : .disabledTextColor)
                    .frame(maxWidth: .infinity, minHeight: 54)
                    .background(jobStatus == .unemployed ? Color.sub : Color.mainBackground)
                    .cornerRadius(10)
            }

            
            Button {
                jobStatus = .employed
            } label: {
                Text("직장인")
                    .applyInner(color: jobStatus == .employed ? .activeTextColor : .disabledTextColor)
                    .frame(maxWidth: .infinity, minHeight: 54)
                    .background(jobStatus == .employed ? Color.sub : Color.mainBackground)
                    .cornerRadius(10)
            }
        }
    }
    
    private var experienceTitle: some View {
        Text("반려동물 경험")
            .applySubtitle(color: .mainTextColor)
    }
    
    private var experienceButton: some View {
        CustomLazyVGrid(col: 2, spacing: 10) {
            Button {
                experienceNumber = .yes
            } label: {
                Text("있음")
                    .applyInner(color: experienceNumber == .yes ? .activeTextColor : .disabledTextColor)
                    .frame(maxWidth: .infinity, minHeight: 54)
                    .background(experienceNumber == .yes ? Color.sub : Color.mainBackground)
                    .cornerRadius(10)
            }
            
            Button {
                experienceNumber = .no
            } label: {
                Text("없음")
                    .applyInner(color: experienceNumber == .no ? .activeTextColor : .disabledTextColor)
                    .frame(maxWidth: .infinity, minHeight: 54)
                    .background(experienceNumber == .no ? Color.sub : Color.mainBackground)
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
        CustomLazyVGrid(col: 4, spacing: 10) {
            Button {
                houseNumber = .oneRoom
            } label: {
                Text("원룸")
                    .applyInner(color: houseNumber == .oneRoom ? .activeTextColor : .disabledTextColor)
                    .frame(maxWidth: .infinity, minHeight: 54)
                    .background(houseNumber == .oneRoom ? Color.sub : Color.mainBackground)
                    .cornerRadius(10)
            }
            
            Button {
                houseNumber = .apart
            } label: {
                Text("아파트")
                    .applyInner(color: houseNumber == .apart ? .activeTextColor : .disabledTextColor)
                    .frame(maxWidth: .infinity, minHeight: 54)
                    .background(houseNumber == .apart ? Color.sub : Color.mainBackground)
                    .cornerRadius(10)
            }
            
            Button {
                houseNumber = .op
            } label: {
                Text("오피스텔\n빌라")
                    .applyInner(color: houseNumber == .op ? .activeTextColor : .disabledTextColor)
                    .frame(maxWidth: .infinity, minHeight: 54)
                    .background(houseNumber == .op ? Color.sub : Color.mainBackground)
                    .cornerRadius(10)
            }
            
            Button {
                houseNumber = .house
            } label: {
                Text("단독주택")
                    .applyInner(color: houseNumber == .house ? .activeTextColor : .disabledTextColor)
                    .frame(maxWidth: .infinity, minHeight: 54)
                    .background(houseNumber == .house ? Color.sub : Color.mainBackground)
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
                    .background(Color.mainBackground)
                    .cornerRadius(10)
            }
            
            ZStack {
                Rectangle()
                    .fill(Color.mainBackground)
                    
                    
                Text("\(person)")
                    .background(Color.mainBackground)
            }
            .frame(height: 54)
            .cornerRadius(10)
        
            Button {
                person += 1
            } label: {
                Text("+")
                    .applyInner(color: .disabledTextColor)
                    .frame(width: 54, height: 54)
                    .background(Color.mainBackground)
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
                .background(Color.mainBackground)
                .cornerRadius(10)
                .onTapGesture { endTextEditing() }
        }
    }
    
    private var openKakaoLink: some View {
        Text("오픈 카톡방 링크")
            .applySubtitle(color: .mainTextColor)
    }
    
    private var openKakaoTextfield: some View {
        ZStack(alignment: Alignment(horizontal: .leading, vertical: .top)) {
            TextField("링크를 붙여주세요", text: $kakaoLinkString, axis: .horizontal)
                .frame(maxWidth: .infinity,alignment: .center)
                .frame(height: 30)
                .font(.system(size: 22))
                .padding()
                .lineLimit(1)
                .background(Color.mainBackground)
                .cornerRadius(10)
                .onTapGesture { endTextEditing() }
        }
    }
    
    private var registerButton: some View {
        Button {
            isShowSheet = true
            //모달 sheet올리기
            viewModel.putEditProfile(ProfileEditVO(job: jobStatus.rawValue, environment: "집", people: person, comment: viewModel.profile.comment, openTalk: viewModel.profile.openTalk, region: viewModel.profile.region, isExperience: true, profileImageId: 1, experiences: []))
            
            if viewModel.isShowModal {
                
                print("성공모달")
                viewModel.profile = ProfileVO(job: jobStatus.rawValue,
                                              environment: houseNumber.rawValue,
                                              people: person,
                                              comment: willString,
                                              openTalk: kakaoLinkString,
                                              region: viewModel.profile.region,
                                              isExperience: experienceNumber.description,
                                              nickname: "seunggi",
                                              profileImage: imageNumer.description,
                                              experiences: [(id: 1, species: viewModel.experienceArray[0].species, period: 1)])
            } else {
                print("실패모달")
            }
            
        } label: {
            Text("등록")
                .applyInner(color: willString.isEmpty || kakaoLinkString.isEmpty ? .disabledTextColor : .white)
                .frame(height: 52)
                .frame(maxWidth: .infinity)
        }
        .sheet(isPresented: $isShowSheet, content: {
            ModalView(isSuccess: viewModel.isShowModal)
                .presentationDetents([.height(200)])
        })
        .background(willString.isEmpty || kakaoLinkString.isEmpty ? Color.buttonBackground : Color.main)
        .disabled(willString.isEmpty || kakaoLinkString.isEmpty)
        .cornerRadius(14)
        .padding(.trailing)
        .padding(.bottom)
        .padding(.leading)
    }
}
