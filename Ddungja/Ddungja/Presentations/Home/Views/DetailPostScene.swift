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
            TabView {
                ForEach(viewModel.imagesURLString, id: \.id) { image in
                    PetImageView(imageUrl: image.url)
                        .aspectRatio(contentMode: .fill)
                        .clipped()
                }
            }
            .frame(width: geo.size.width, height: 350)
            .tabViewStyle(.page)
        }
        .onAppear {
            viewModel.getDetailPost(1)
        }
    }
}
