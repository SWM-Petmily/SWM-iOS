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
    static let white = Color("WhiteColor")
    static let tabBar = Color("TabBarColor")
    static let acceptText = Color("AcceptTextColor")
    static let acceptButton = Color("AcceptButtonColor")
    static let rejectText = Color("RejectTextColor")
    static let rejectButton = Color("RejectButtonColor")
}

enum CustomColor: String {
    case mainTextColor
    case mainColor
    case mainBackgroundColor
    case subColor
    case disabledTextColor
    case buttonBackgroundColor
    case activeTextColor
    case white
    case tabBar
    case acceptText
    case acceptButton
    case rejectText
    case rejectButton
    
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
        case .white:
            return "WhiteColor"
        case .tabBar:
            return "TabBarColor"
        case .acceptText:
            return "AcceptTextColor"
        case .acceptButton:
            return "AcceptButtonColor"
        case .rejectText:
            return "RejectTextColor"
        case .rejectButton:
            return "RejectButtonColor"
        }
    }
}
