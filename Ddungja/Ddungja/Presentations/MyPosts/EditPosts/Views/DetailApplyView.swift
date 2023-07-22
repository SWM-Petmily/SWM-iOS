//
//  DetailApplyView.swift
//  Ddungja
//
//  Created by 오승기 on 2023/07/22.
//

import SwiftUI

struct DetailApplyView: View {
    @StateObject private var viewModel: MyPostsViewModel
    private var id: Int
    
    init(viewModel: MyPostsViewModel, id: Int) {
        _viewModel = StateObject(wrappedValue: viewModel)
        self.id = id
    }
    
    var body: some View {
        ScrollView {
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
        }
        .navigationTitle("지원하기")
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Text("지원받은목록")
                    .onTapGesture {
                        viewModel.pop()
                    }
            }
        }
        .onAppear {
            viewModel.getDetailApply(id: id)
        }
        
        CustomLazyVGrid(col: 2, spacing: 10) {
            Button {
                print("거절 tapped")
            } label: {
                Text("거절")
                    .makeRejectButton()
            }
            
            Button {
                print("수락 tapped")
            } label: {
                Text("수락")
                    .makeAcceptButton()
            }
        }
        .padding()
    }
}

extension DetailApplyView {
    private var userTitle: some View {
        HStack(spacing: 14) {
            
            AsyncImage(url: URL(string: viewModel.detailApply.url)) { image in
                image.resizable()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 50, height: 50)
            .clipShape(Circle())
            
            
            VStack(alignment: .leading, spacing: 4) {
                HStack(alignment: .center, spacing: 7) {
                    Text(viewModel.detailApply.nickname)
                        .applyTitle(color: .mainTextColor)
                        .bold()
                    ZStack {
                        RoundedRectangle(cornerRadius: 25, style: .continuous)
                            .stroke(Color.gray, lineWidth: 1)
                            .frame(width: 53, height: 25)
                        
                        Text(viewModel.detailApply.job)
                            .applySubtitle(color: .disabledTextColor)
                    }
                }
                Text("대한민국, \(viewModel.detailApply.region)")
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
                    Text(viewModel.detailApply.isExperience ? "있음" : "없음")
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
                    Text(viewModel.detailApply.applyExperiences.first?.species ?? "-")
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
                    Text(viewModel.detailApply.environment)
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
                    Text("\(viewModel.detailApply.people) 명")
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
                .frame(maxWidth: .infinity, minHeight: 122, maxHeight: .infinity)
                .cornerRadius(15)
                .shadow(color: .gray.opacity(0.3), radius: 10, x: 0, y: 0)
            
            
            VStack(alignment: .leading, spacing: 10) {
                Text("키울 수 있는 각오")
                    .applySubtitle(color: .disabledTextColor)
            
                Text(viewModel.detailApply.comment)
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
            
                Text("\(viewModel.detailApply.openTalk)")
                    .applyInner(color: .mainTextColor)
                    .lineLimit(1)
            }
            .padding()
        }
    }
}
