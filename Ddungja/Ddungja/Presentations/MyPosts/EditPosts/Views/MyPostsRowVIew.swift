//
//  MyPostsRowVIew.swift
//  Ddungja
//
//  Created by 오승기 on 2023/07/17.
//

import SwiftUI

struct ProfileImgView : View {

    var imageUrl: URL

    var body: some View {
        AsyncImage(url: imageUrl) { image in
            image.resizable()
        } placeholder: {
            ProgressView()
        }
        .frame(width: 90, height: 90)
        .cornerRadius(6)
    }
}

struct MyPostsRowVIew: View {
    var viewModel: MyPostsViewModel
    var myPost: EditPostsInfoVO
    
    var body: some View {
        VStack {
            HStack(spacing: 20) {
                ProfileImgView(imageUrl: myPost.thumbnailImage)
                    .padding(.leading)
                
                HStack {
                    VStack(alignment: .leading) {
                        HStack {
                            Image(systemName: "message")
                                .foregroundColor(.disabledText)
                            Text("10")
                                .applySubtitle(color: .mainTextColor)
                            Image(systemName: "heart")
                                .foregroundColor(.disabledText)
                            Text("\(myPost.like)")
                                .applySubtitle(color: .mainTextColor)
                        }
                        Spacer()
                        
                        Text(myPost.subCategory)
                            .applyInner(color: .mainTextColor)
                            .bold()
                        Spacer()
                        Text(myPost.name)
                            .applyInner(color: .mainTextColor)
                            .bold()
                    }
                    
                    Spacer()
                    
                    VStack {
                        Text("\(myPost.createdDate)")
                        
                        Spacer()
                        
                        ZStack(alignment: .leading) {
                            Rectangle()
                                .fill(.white)
                                .frame(height: 30)
                                .frame(width: 80)
                                .cornerRadius(6)
                            
                            Button {
                                viewModel.push(.applyList(id: myPost.postId))
                            } label: {
                                Text("지원자목록")
                                    .applyInner(color: .mainColor)
                                    .frame(height: 30)
                                    .frame(width: 80)
                                    .cornerRadius(6)
                            }
                        }
                        .shadow(color: .gray.opacity(0.3), radius: 10, x: 0, y: 0)
                    }
                    .padding(.trailing)
                }
                .padding([.top, .bottom])
            }
            
            ZStack {
                Rectangle()
                    .fill(Color.buttonBackground)
                    .frame(height: 40)
                    .frame(maxWidth: .infinity)
                    .cornerRadius(5)
                
                HStack() {
                    
                    HStack(alignment: .center) {
                        Text("지역")
                            .applySubtitle(color: .disabledTextColor)
                        Text(myPost.region)
                            .applySubtitle(color: .mainTextColor)
                            .bold()
                    }
                    .padding()
                    
                    Divider()
                        .frame(width: 1, height: 35)
                    
                    
                    HStack(alignment: .center) {
                        Text("나이")
                            .applySubtitle(color: .disabledTextColor)
                        Text(viewModel.changeBirthToAge(myPost.birth))
                            .applySubtitle(color: .mainTextColor)
                            .bold()
                    }
                    .padding()

                    Divider()
                        .frame(width: 1, height: 35)
                    
                    HStack(alignment: .center) {
                        Text("성별")
                            .applySubtitle(color: .disabledTextColor)
                        Text(viewModel.genderType(myPost.gender))
                            .applySubtitle(color: .mainTextColor)
                            .bold()
                    }
                    .padding()
                }
            }
            .padding([.leading, .trailing])
            
            Divider()
                .frame(height: 1)
                .frame(maxWidth: .infinity)
                .padding(.bottom)
        }
    }
}
