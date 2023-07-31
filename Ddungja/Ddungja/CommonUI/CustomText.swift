//
//  CustomText.swift
//  Ddungja
//
//  Created by 오승기 on 2023/07/04.
//

import SwiftUI

struct CustomText: ViewModifier {
    let color: Color
    let font: Font
    
    func body(content: Content) -> some View {
        return content
            .foregroundColor(color)
            .font(font)
    }
}

extension Text {
    //Default Font Size -> 20
    func applyBigTitle(color: CustomColor) -> some View {
        self.modifier(CustomText(color: Color(color.customValue), font: .title3))
    }
    //Default Font Size -> 17
    func applyTitle(color: CustomColor) -> some View {
        self.modifier(CustomText(color: Color(color.customValue), font: .headline))
    }
    //Default Font Size -> 16
    func applyInner(color: CustomColor) -> some View {
        self.modifier(CustomText(color: Color(color.customValue), font: .callout))
    }
    //Default Font Size -> 15
    func applySubhead(color: CustomColor) -> some View {
        self.modifier(CustomText(color: Color(color.customValue), font: .subheadline))
    }
    //Default Font Size -> 13
    func applySubtitle(color: CustomColor) -> some View {
        self.modifier(CustomText(color: Color(color.customValue), font: .footnote))
    }
}
