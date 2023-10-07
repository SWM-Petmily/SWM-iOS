//
//  Home.swift
//  Ddungja
//
//  Created by 오승기 on 2023/10/06.
//

import SwiftUI

struct CarouselScene: View {
    @ObservedObject private var viewModel = CarouselViewModel()
    
    var body: some View {
        GeometryReader {
            let size = $0.size
            TabView(selection: $viewModel.currentPage, content: {
                ForEach(viewModel.fakedPages) { page in
                    
//                        Image(page.name)
                    
                    ImageTextContentView(imageName: page.name, title: page.title, sub: page.subTitle,size: size)
//                            .resizable()
//                            .scaledToFit()
//                            .frame(width: 300, height: size.height)
                            .tag(page.id.uuidString)
                            .offsetX(viewModel.currentPage == page.id.uuidString) { rect in
                                viewModel.calculate(rect: rect, size: size, page: page)
                            }
                }
            })
            .tabViewStyle(.page(indexDisplayMode: .never))
            .overlay(alignment: .bottom) {
                PageControl(totalPage: viewModel.listOfPages.count, currentPage: viewModel.originalIndex())
                    .offset(y: -5)
            }
        }
        .frame(height: 500)
    }
}

struct ImageTextContentView: View {
    var imageName: String
    var title: String
    var sub: String
    var size: CGSize
    
    var body: some View {
        VStack(spacing: 5) {
            Image(imageName)
                .resizable()
                .scaledToFit()
                .frame(width: size.width, height: size.height / 2)
            VStack(alignment: .leading) {
                Text(title)
                    .bold()
                    .padding()
                
                Text(sub)
                    .padding()
            }
        }
    }
}
