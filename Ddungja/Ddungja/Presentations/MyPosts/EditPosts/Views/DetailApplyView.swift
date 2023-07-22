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
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}
