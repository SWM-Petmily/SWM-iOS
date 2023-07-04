//
//  CustomLazyVGrid.swift
//  Ddungja
//
//  Created by 오승기 on 2023/07/04.
//

import SwiftUI

struct CustomLazyVGrid<Content>: View where Content: View {
    let col: Int
    let spacing: CGFloat
    let content: () -> Content
    
    init(col: Int, spacing: CGFloat, @ViewBuilder content: @escaping () -> Content) {
        self.col = col
        self.spacing = spacing
        self.content = content
    }
    
    fileprivate var columns: [GridItem] {
        Array(repeating: GridItem(.flexible(), spacing: spacing), count: col)
    }
    
    var body: some View {
        LazyVGrid(columns: columns, spacing: spacing) {
            content()
        }
    }
}

extension LazyVGrid {
    func makeVGrid<Content>(col: Int, spacing: CGFloat, @ViewBuilder content: @escaping () -> Content) -> CustomLazyVGrid<Content> where Content: View {
        CustomLazyVGrid(col: col, spacing: spacing, content: content)
    }
}
