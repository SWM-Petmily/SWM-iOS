//
//  CustomColor.swift
//  Ddungja
//
//  Created by 오승기 on 2023/07/04.
//

import SwiftUI

extension Color {
    static let mainText = Color("MainTextColor")
    static let main = Color("MainColor")
    static let mainBackground = Color("MainBackgroundColor")
    static let sub = Color("SubColor")
    static let disabledText = Color("DisabledTextColor")
    static let buttonBackground = Color("ButtonBackgroundColor")
    static let activeText = Color("ActiveTextColor")
}

enum CustomColor: String {
    case mainTextColor
    case mainColor
    case mainBackgroundColor
    case subColor
    case disabledTextColor
    case buttonBackgroundColor
    case activeTextColor
    
//    var customValue: Color {
//        switch self {
//        case .mainTextColor:
//            return Color("MainTextColor")
//        case .mainColor:
//            return Color("MainColor")
//        case .mainBackgroundColor:
//            return Color("MainBackgroundColor")
//        case .subColor:
//            return Color("SubColor")
//        case .disabledTextColor:
//            return Color("DisabledTextColor")
//        case .buttonBackgroundColor:
//            return Color("ButtonBackgroundColor")
//        case .activeTextColor:
//            return Color("ActiveTextColor")
//        }
//    }
    var customValue: String {
        switch self {
        case .mainTextColor:
            return "MainTextColor"
        case .mainColor:
            return "MainColor"
        case .mainBackgroundColor:
            return "MainBackgroundColor"
        case .subColor:
            return "SubColor"
        case .disabledTextColor:
            return "DisabledTextColor"
        case .buttonBackgroundColor:
            return "ButtonBackgroundColor"
        case .activeTextColor:
            return "ActiveTextColor"
        }
    }
}
