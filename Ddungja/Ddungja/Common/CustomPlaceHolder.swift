//
//  CustomPlaceHolder.swift
//  Ddungja
//
//  Created by 오승기 on 2023/07/29.
//

import SwiftUI

struct PlaceholderStyle: ViewModifier {
    var showPlaceHolder: Bool
    var placeholder: String

    func body(content: Content) -> some View {
        ZStack(alignment: .leading) {
            if showPlaceHolder {
                Text(placeholder)
                    .foregroundColor(Color.disabledText)
                    .bold()
            }
            
            content
                .foregroundColor(Color.mainText)
                .bold()
        }
    }
}

