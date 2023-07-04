//
//  CustomColor.swift
//  Ddungja
//
//  Created by 오승기 on 2023/07/04.
//

import SwiftUI

enum CustomColor: String {
    case mainTextColor
    case mainColor
    case mainBackgroundColor
    case subColor
    case disabledTextColor
    case buttonBackgroundColor
    case activeTextColor
    
    var customValue: Color {
        switch self {
        case .mainTextColor:
            return Color("MainTextColor")
        case .mainColor:
            return Color("MainColor")
        case .mainBackgroundColor:
            return Color("MainBackgroundColor")
        case .subColor:
            return Color("SubColor")
        case .disabledTextColor:
            return Color("DisabledTextColor")
        case .buttonBackgroundColor:
            return Color("ButtonBackgroundColor")
        case .activeTextColor:
            return Color("ActiveTextColor")
        }
    }
}
