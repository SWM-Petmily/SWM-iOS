//
//  RadioButton.swift
//  Ddungja
//
//  Created by 오승기 on 2023/07/31.
//

import SwiftUI

struct RadioButton: ViewModifier {
    var status: String
    var buttonState: String
    
    func body(content: Content) -> some View {
        let isActive = status == buttonState
        
        return ZStack {
            RoundedRectangle(cornerRadius: 15, style: .continuous)
                .strokeBorder(isActive ? Color.main : .buttonBackground)
                .background(isActive ? .white : .buttonBackground)
                .cornerRadius(15)
            
            content
                .bold(isActive)
                .foregroundColor(
                    Color(
                        isActive ? CustomColor.mainColor.customValue : CustomColor.disabledTextColor.customValue
                    )
                )
        }
    }
}

struct RadioButtonMain: ButtonStyle {
    var status: String
    var buttonState: String
    func makeBody(configuration: Configuration) -> some View {
        let isActive = status == buttonState
        
        configuration.label
            .frame(maxWidth: .infinity, minHeight: 54)
            .foregroundColor(isActive ? Color(CustomColor.activeTextColor.customValue) : Color(CustomColor.disabledTextColor.customValue))
            .background(isActive ? Color.sub : Color.mainBackground)
            .cornerRadius(10)
    }
}
