//
//  DetailPostScene.swift
//  Ddungja
//
//  Created by 오승기 on 2023/08/03.
//

import SwiftUI

struct PetImageView: View {
    var imageUrl: String

    var body: some View {
        if let url = URL(string: imageUrl) {
            AsyncImage(url: url) { image in
                image.resizable()
            } placeholder: {
                ProgressView()
            }
        } else {
            EmptyView()
        }
    }
}

struct DetailPostScene: View {
    @StateObject private var viewModel: DetailPostViewModel
    private var postId: Int
    
    init(viewModel: DetailPostViewModel, postId: Int) {
        _viewModel = StateObject(wrappedValue: viewModel)
        self.postId = postId
    }
    
    var body: some View {
        GeometryReader { geo in
            VStack {
                ScrollView {
                    VStack(alignment: .leading) {
                        TabView {
                            ForEach(viewModel.imagesURLString, id: \.id) { image in
                                PetImageView(imageUrl: image.url)
                                    .aspectRatio(contentMode: .fill)
                                    .clipped()
                            }
                        }
                        .frame(width: geo.size.width, height: 350)
                        .tabViewStyle(.page)
                        
                        userTitle
                        
                        petInfo
                        petPrice
                        
                        healthInfo
                        diseaseInfo
                        
                        reason
                        
                        
                        advantage
                        
                        disadvantage
                    }
                }
                .edgesIgnoringSafeArea(.all)
                HStack {
                    VStack(alignment: .center) {
                        Image(systemName: "heart")
                            .foregroundColor(.disabledText)
                            .frame(width: 24, height: 24)
                        Text("\(viewModel.detail?.likeCount ?? -1)")
                            .bold()
                            .applySubtitle(color: .mainTextColor)
                    }
                    .padding(.leading, 20)
                    
                    Button {
                        
                    } label: {
                        Text("입양 신청하기")
                            .bold()
                            .applyInner(color: .white)
                            .frame(height: 52)
                            .frame(maxWidth: .infinity)
                    }
                    .background(Color.main)
                    .cornerRadius(14)
                    .padding()
                }
            }
            .navigationBarBackButtonHidden()
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Image(systemName: "chevron.backward")
                        .onTapGesture {
                            viewModel.pop()
                        }
                }
            }
        }
        .onAppear {
            viewModel.getDetailPost(1)
        }
    }
}

extension DetailPostScene {
    private var userTitle: some View {
        HStack(spacing: 14) {
            ZStack {
                Circle()
                    .fill(.gray)
                    .frame(width: 50, height: 50)
                Image(viewModel.changIdToProfile(viewModel.detail?.writerProfileImage ?? -1))
                    .resizable()
                    .frame(width: 40, height: 40)
            }
            
            VStack(alignment: .leading, spacing: 4) {
                Text(viewModel.detail?.writer ?? "")
                    .applyTitle(color: .mainTextColor)
                    .bold()
                
                Text("대한민국, \(viewModel.detail?.region ?? "")")
                    .applySubtitle(color: .disabledTextColor)
            }
        }
        .padding([.leading, .trailing])
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var petInfo: some View {
        ZStack(alignment: .leading) {
            Rectangle()
                .fill(.white)
                .frame(maxWidth: .infinity)
                .frame(height: 84)
                .cornerRadius(15)
            HStack(alignment: .center, spacing: 5) {
                VStack(alignment: .leading) {
                    Text(viewModel.detail?.subCategory ?? "")
                        .applySubtitle(color: .disabledTextColor)
                    Text(viewModel.detail?.name ?? "")
                        .applyBigTitle(color: .mainTextColor)
                }
                
                Spacer()
                
                Text("\(viewModel.changeGenderToImage(viewModel.detail?.gender ?? "MALE"))")
                    .padding(5)
                    .background(Circle().fill(Color.homeSubFilter))
                
                Text(viewModel.changeMonthToAge(viewModel.detail?.age ?? 0))
                    .applySubtitle(color: .mainTextColor)
                    .padding(5)
                    .background(RoundedRectangle(cornerRadius: 75).fill(Color.homeSubFilter))
            }
            .padding()
        }
        .padding([.leading, .trailing])
        .shadow(color: .gray.opacity(0.3), radius: 10, x: 0, y: 0)
    }
    
    private var petPrice: some View {
        ZStack(alignment: .leading) {
            Rectangle()
                .fill(.white)
                .frame(maxWidth: .infinity)
                .frame(height: 84)
                .cornerRadius(15)
            HStack(alignment: .center, spacing: 5) {
                Text("책임비")
                    .applyBigTitle(color: .mainTextColor)
                
                Spacer()
                
                Text("\(viewModel.detail?.money ?? 0)원")
                    .applyBigTitle(color: .mainTextColor)
            }
            .padding()
        }
        .padding([.leading, .trailing])
        .shadow(color: .gray.opacity(0.3), radius: 10, x: 0, y: 0)
    }
    
    private var healthInfo: some View {
        VStack {
            Text("기본정보")
                .applySubhead(color: .mainTextColor)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            CustomLazyVGrid(col: 2, spacing: 10) {
                ZStack(alignment: .leading) {
                    Rectangle()
                        .fill(.white)
                        .frame(maxWidth: .infinity, minHeight: 77)
                        .cornerRadius(15)
                    
                    VStack(alignment: .leading, spacing: 10) {
                        Text("예방접종")
                            .applySubtitle(color: .disabledTextColor)
                        Text(viewModel.detail?.vaccinated ?? "-")
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
                        Text("건강검짐")
                            .applySubtitle(color: .disabledTextColor)
                        Text(viewModel.detail?.medicalChecked ?? "-")
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
                        Text("반려동물 등록인증")
                            .applySubtitle(color: .disabledTextColor)
                        Text(viewModel.detail?.registered ?? "-")
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
                        Text("중성화")
                            .applySubtitle(color: .disabledTextColor)
                        Text(viewModel.detail?.neutered ?? "-")
                            .applyInner(color: .mainTextColor)
                    }
                    .padding()
                }
            }
            .shadow(color: .gray.opacity(0.3), radius: 10, x: 0, y: 0)
        }
        .padding()
    }
    
    private var diseaseInfo: some View {
        VStack(alignment: .leading) {
            Text("반려동물이 가지고 있는 질병")
                .applySubhead(color: .mainTextColor)
                .bold()
            HStack(spacing: 10) {
                ForEach(viewModel.diseaseInfo, id: \.self) { info in
                    Text(info)
                        .applySubtitle(color: .mainTextColor)
                        .padding(3)
                        .background(RoundedRectangle(cornerRadius: 35).fill(Color.disabledText).opacity(0.18))
                }
                Text("해당없음")
                    .applyInner(color: .mainTextColor)
                    .bold()
                    .isHidden(!viewModel.diseaseInfo.isEmpty)
            }
            
            Divider()
        }
        .padding([.leading, .trailing])
    }
    
    private var reason: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text("분양이유")
                .applySubhead(color: .mainTextColor)
            
            Text(viewModel.detail?.reason ?? "")
                .bold()
                .applyInner(color: .mainTextColor)
            
            Divider()
        }
        .padding([.leading, .trailing])
    }
    
    private var advantage: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text("반려동물 자랑")
                .applySubhead(color: .mainTextColor)
            
            Text(viewModel.detail?.advantage ?? "")
                .bold()
                .applyInner(color: .mainTextColor)
            
            Divider()
        }
        .padding([.leading, .trailing])
    }
    
    private var disadvantage: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text("주의할 점")
                .applySubhead(color: .mainTextColor)
            
            Text(viewModel.detail?.disadvantage ?? "")
                .bold()
                .applyInner(color: .mainTextColor)
        }
        .padding([.leading, .trailing])
    }
}
