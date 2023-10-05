//
//  ToastStyle.swift
//  Ddungja
//
//  Created by 오승기 on 2023/10/05.
//

import SwiftUI

enum ToastStyle {
    case error
    case warning
    case success
}

extension ToastStyle {
    var themeColor: Color {
        switch self {
        case .error: return Color.red
        case .warning: return Color.orange
        case .success: return Color.green
        }
    }
    
    var iconFileName: String {
        switch self {
        case .error: return "xmark.circle.fill"
        case .warning: return "exclamationmark.triangle.fill"
        case .success: return "checkmark.circle.fill"
        }
    }
}
