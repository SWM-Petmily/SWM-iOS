//
//  LikeListScene.swift
//  Ddungja
//
//  Created by 오승기 on 2023/08/18.
//

import SwiftUI

struct LikeListScene: View {
    @StateObject private var viewModel: LikeListViewModel
    
    init(viewModel: LikeListViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                Text("전체")
                    .modifier(RadioButton(status: viewModel.status, buttonState: LikeListButtonState.all.rawValue))
                    .onTapGesture {
                        viewModel.status = LikeListButtonState.all.rawValue
                        viewModel.getLikeList()
                    }
                
                Text("분양중")
                    .modifier(RadioButton(status: viewModel.status, buttonState: LikeListButtonState.save.rawValue))
                    .onTapGesture {
                        viewModel.status = LikeListButtonState.save.rawValue
                        viewModel.getLikeList()
                    }
                
                Text("분양완료")
                    .modifier(RadioButton(status: viewModel.status, buttonState: LikeListButtonState.complete.rawValue))
                    .onTapGesture {
                        viewModel.status = LikeListButtonState.complete.rawValue
                        viewModel.getLikeList()
                    }
            }
            .frame(height: 33)
            .frame(maxWidth: .infinity)
        }
        .padding()
        
        ScrollView {
            LazyVStack {
                ForEach(viewModel.likeList, id: \.id) { info in
                    LikePostRowView(viewModel: viewModel, likePost: info)
                        .onAppear{
                            print(info)
                            fetchMoreData(info)
                        }
                }
            }
        }
        .analyticsScreen(name: "LikeListScene")
        .navigationTitle("관심 분양글")
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Image(systemName: "chevron.backward")
                    .onTapGesture {
                        viewModel.pop()
                    }
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                HStack(spacing: 15) {
                    Image(systemName: "magnifyingglass")
                    Image(systemName: "bell")
                }
            }
        }
        .onAppear {
            viewModel.getLikeList()
        }
    }
}

extension LikeListScene {
    private func fetchMoreData(_ like: LikeListInfoVO){
        if self.viewModel.likeList.last == like {
            viewModel.fetchMoreLikeList()
        }
    }
}
