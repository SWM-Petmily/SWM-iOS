//
//  MyPostsView.swift
//  Ddungja
//
//  Created by 오승기 on 2023/07/14.
//

import SwiftUI

struct MyPostsView: View {
    var body: some View {
        ScrollView {
        }
        .navigationTitle("작성한 분양글")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                HStack(spacing: 15) {
                    Image(systemName: "text.justify.left")
                    Image(systemName: "magnifyingglass")
                    Image(systemName: "bell")
                }
            }

        }
    }
}

struct MyPostsView_Previews: PreviewProvider {
    static var previews: some View {
        MyPostsView()
    }
}
