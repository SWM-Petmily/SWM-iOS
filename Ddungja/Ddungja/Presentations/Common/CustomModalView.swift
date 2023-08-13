//
//  SwiftUIView.swift
//  Ddungja
//
//  Created by 오승기 on 2023/08/13.
//

import SwiftUI

struct CustomModalView: View {
    let coordinator: CoordinatorProtocol
    let title: String
    
    var body: some View {
        Text(title)
            .applyBigTitle(color: .mainTextColor)
        
        Button {
            coordinator.pop()
        } label: {
            Text("확인")
                .applyInner(color: .white)
                .bold()
                .frame(maxWidth: .infinity)
                .frame(height: 52)
                .background(Color.main)
                .cornerRadius(15)
        }
        .padding()
    }
}
