//
//  HomeView.swift
//  Ddungja
//
//  Created by 오승기 on 2023/07/12.
//

import SwiftUI

struct BackgroundImage: View {
    let imageURL: String
    
    var body: some View {
        AsyncImage(url: URL(string: imageURL)!) { image in
            image.resizable()
                .aspectRatio(contentMode: .fill)
        } placeholder: {
            ProgressView()
        }
        .cornerRadius(14)
    }
}
struct HomeScene: View {
    @StateObject private var viewModel: HomeViewModel

    init(viewModel: HomeViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                CustomLazyVGrid(col: 2, spacing: 10) {
                    ForEach(viewModel.info, id: \.id) { info in
                        VStack(alignment: .leading) {
                            ZStack {
                                BackgroundImage(imageURL: info.thumbnailImage)
                                    .frame(minWidth: 160, maxWidth: .infinity)
                                    .frame(height: 215)
                                    .clipShape(RoundedRectangle(cornerRadius: 14))
                                
                                VStack {
                                    HStack(alignment: .center) {
                                        
                                        Text(info.createdDate)
                                            .applySubtitle(color: .white)
                                            .padding(3)
                                            .background(RoundedRectangle(cornerRadius: 35).fill(Color.black).opacity(0.18))
                                        
                                        Spacer()
                                        
                                        Image(systemName: "heart")
                                            .foregroundColor(.white)
                                    }
                                    
                                    Spacer()
                                    
                                    
                                    VStack(alignment: .leading, spacing: 5) {
                                        Text(info.subCategory)
                                            .applySubtitle(color: .white)
                                        
                                        HStack {
                                            Text(info.name)
                                                .bold()
                                                .applyInner(color: .white)
                                            
                                            Spacer()
                                            
                                            Text("\(info.money)원")
                                                .applySubtitle(color: .white)
                                                .padding(3)
                                                .background(RoundedRectangle(cornerRadius: 35).fill(Color.black).opacity(0.18))
                                        }
                                        
                                    }
                                }
                                .padding(10)
                            }
                            HStack {
                                Text("\(viewModel.changeGenderToImage(info.genderType))")
                                    .padding(5)
                                    .background(Circle().fill(Color.homeSubFilter))
                                
                                Text(info.region)
                                    .applySubhead(color: .mainTextColor)
                                    .padding(5)
                                    .background(RoundedRectangle(cornerRadius: 75).fill(Color.homeSubFilter))
                                Text(viewModel.changeMonthToAge(info.age))
                                    .applySubhead(color: .mainTextColor)
                                    .padding(5)
                                    .background(RoundedRectangle(cornerRadius: 75).fill(Color.homeSubFilter))
                            }
                        }
                    }
                }
                .padding([.leading, .trailing])
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Image(systemName: "gearshape")
                }
            }
            
            .onAppear {
                viewModel.getMainPost()
            }
        }
    }
}
