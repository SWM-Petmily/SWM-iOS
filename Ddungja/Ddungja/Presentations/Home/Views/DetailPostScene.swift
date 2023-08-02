//
//  DetailPostScene.swift
//  Ddungja
//
//  Created by 오승기 on 2023/08/03.
//

import SwiftUI

struct DetailPostScene: View {
    @StateObject private var viewModel: DetailPostViewModel
    private var postId: Int
    
    init(viewModel: DetailPostViewModel, postId: Int) {
        _viewModel = StateObject(wrappedValue: viewModel)
        self.postId = postId
    }
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}
