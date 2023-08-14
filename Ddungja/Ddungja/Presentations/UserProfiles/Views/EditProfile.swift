//
//  EditProfile.swift
//  Ddungja
//
//  Created by 오승기 on 2023/07/03.
//

import SwiftUI

struct EditProfile: View {
    
    @State private var isShowSheet = false
    
    @StateObject private var viewModel: UserProfileViewModel
    
    init(viewModel: UserProfileViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
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
                
                if(viewModel.experience == .yes) {
                    selectSpeciesTitle
                    
                    LazyVStack {
                        ForEach(viewModel.experienceArray, id: \.id) { experience in
                            ExperienceRow(id: experience.id,
                                          species: experience.species,
                                          year: String(experience.period / 12),
                                          month: String(experience.period % 12),
                                          viewModel: viewModel)
                        }
                        .transition(AnyTransition.opacity.animation(.easeInOut))
                    }
                    
                    Button {
                        withAnimation {
                            viewModel.experienceArray.append((id: UUID().uuidString, species: "", period: 0))
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
            .navigationBarBackButtonHidden()
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Text("프로필")
                        .onTapGesture {
                            viewModel.pop()
                        }
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
        }
        .onAppear {
            viewModel.getProfile()
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
                            viewModel.image.rawValue == 1 ?
                            Circle().stroke(Color.orange,lineWidth: 2) :
                                Circle().stroke(Color.orange,lineWidth: 0)
                        )
                    Image("bulldog")
                        .resizable()
                        .frame(width: 50, height: 50, alignment: .center)
                }
                .onTapGesture {
                    viewModel.image = .bulldog
                }
                
                ZStack {
                    Circle()
                        .fill(.gray)
                        .frame(width: 68, height: 68)
                        .overlay(
                            viewModel.image.rawValue == 2 ?
                            Circle().stroke(Color.orange,lineWidth: 2) :
                                Circle().stroke(Color.orange,lineWidth: 0)
                        )
                    Image("dog1")
                        .resizable()
                        .frame(width: 50, height: 50)
                }
                .onTapGesture {
                    viewModel.image = .dog1
                }
                
                ZStack {
                    Circle()
                        .fill(.cyan)
                        .frame(width: 68, height: 68)
                        .overlay(
                            viewModel.image.rawValue == 3 ?
                            Circle().stroke(Color.orange,lineWidth: 2) :
                                Circle().stroke(Color.orange,lineWidth: 0)
                        )
                    Image("dog2")
                        .resizable()
                        .frame(width: 50, height: 50)
                }
                .onTapGesture {
                    viewModel.image = .dog2
                }
                
                ZStack {
                    Circle()
                        .fill(.orange)
                        .frame(width: 68, height: 68)
                        .overlay(
                            viewModel.image.rawValue == 4 ?
                            Circle().stroke(Color.orange,lineWidth: 2) :
                                Circle().stroke(Color.orange,lineWidth: 0)
                        )
                    Image("poodle")
                        .resizable()
                        .frame(width: 50, height: 50)
                }
                .onTapGesture {
                    viewModel.image = .poodle
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
            Button("학생") {
                viewModel.job = .student
            }
            .buttonStyle(RadioButtonMain(status: viewModel.job.rawValue, buttonState: EmploymentStatus.student.rawValue))
            
            
            Button("무직") {
                viewModel.job = .unemployed
            }
            .buttonStyle(RadioButtonMain(status: viewModel.job.rawValue, buttonState: EmploymentStatus.unemployed.rawValue))
            
            Button("직장인") {
                viewModel.job = .employed
            }
            .buttonStyle(RadioButtonMain(status: viewModel.job.rawValue, buttonState: EmploymentStatus.employed.rawValue))
        }
    }
    
    private var experienceTitle: some View {
        Text("반려동물 경험")
            .applySubtitle(color: .mainTextColor)
    }
    
    private var experienceButton: some View {
        CustomLazyVGrid(col: 2, spacing: 10) {
            Button {
                viewModel.experience = .yes
            } label: {
                Text("있음")
                    .applyInner(color: viewModel.experience == .yes ? .activeTextColor : .disabledTextColor)
                    .frame(maxWidth: .infinity, minHeight: 54)
                    .background(viewModel.experience == .yes ? Color.sub : Color.mainBackground)
                    .cornerRadius(10)
            }
            
            Button {
                viewModel.experience = .no
            } label: {
                Text("없음")
                    .applyInner(color: viewModel.experience == .no ? .activeTextColor : .disabledTextColor)
                    .frame(maxWidth: .infinity, minHeight: 54)
                    .background(viewModel.experience == .no ? Color.sub : Color.mainBackground)
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
            Button("원룸") {
                viewModel.house = .oneRoom
            }
            .buttonStyle(RadioButtonMain(status: viewModel.house.rawValue, buttonState: HouseStatus.oneRoom.rawValue))
            
            Button("아파트") {
                viewModel.house = .apart
            }
            .buttonStyle(RadioButtonMain(status: viewModel.house.rawValue, buttonState: HouseStatus.apart.rawValue))
            
            Button("오피스텔") {
                viewModel.house = .op
            }
            .buttonStyle(RadioButtonMain(status: viewModel.house.rawValue, buttonState: HouseStatus.op.rawValue))
            
            Button("단독주택") {
                viewModel.house = .house
            }
            .buttonStyle(RadioButtonMain(status: viewModel.house.rawValue, buttonState: HouseStatus.house.rawValue))
        }
    }
    
    private var personTitle: some View {
        Text("함께 거주하는 인원")
            .applySubtitle(color: .mainTextColor)
    }
    
    private var personButton: some View {
        HStack(spacing: 10) {
            Button {
                if(viewModel.person >= 1) { viewModel.person -= 1 }
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
                    
                    
                Text("\(viewModel.person)")
                    .background(Color.mainBackground)
            }
            .frame(height: 54)
            .cornerRadius(10)
        
            Button {
                viewModel.person += 1
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
            TextField("진정성 있는 각오를 작성해주세요", text: $viewModel.comment, axis: .vertical)
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
            TextField("링크를 붙여주세요", text: $viewModel.openTalk, axis: .horizontal)
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
            viewModel.putEditProfile(ProfileEditVO(job: viewModel.job.rawValue, environment: "집", people: viewModel.person, comment: viewModel.comment, openTalk: viewModel.openTalk, region: viewModel.profile.region, isExperience: true, profileImageId: 1, experiences: []))
            
            if viewModel.isShowModal {
                
                print("성공모달")
                viewModel.profile = ProfileVO(job: viewModel.job.rawValue,
                                              environment: viewModel.house.rawValue,
                                              people: viewModel.person,
                                              comment: viewModel.comment,
                                              openTalk: viewModel.openTalk,
                                              region: viewModel.profile.region,
                                              isExperience: viewModel.experience.description,
                                              nickname: "seunggi",
                                              profileImageId: viewModel.image.rawValue,
                                              profileImage: viewModel.image.description,
                                              experiences: [(id: "1", species: viewModel.experienceArray[0].species, period: 1)])
            } else {
                print("실패모달")
            }
            
        } label: {
            Text("등록")
                .applyInner(color: viewModel.comment.isEmpty || viewModel.openTalk.isEmpty ? .disabledTextColor : .white)
                .frame(height: 52)
                .frame(maxWidth: .infinity)
        }
        .sheet(isPresented: $isShowSheet, content: {
            ModalView(isSuccess: viewModel.isShowModal)
                .presentationDetents([.height(200)])
        })
        .background(viewModel.comment.isEmpty || viewModel.openTalk.isEmpty ? Color.buttonBackground : Color.main)
        .disabled(viewModel.comment.isEmpty || viewModel.openTalk.isEmpty)
        .cornerRadius(14)
        .padding(.trailing)
        .padding(.bottom)
        .padding(.leading)
    }
}
