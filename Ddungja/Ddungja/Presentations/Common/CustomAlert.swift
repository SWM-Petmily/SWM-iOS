//
//  CustomAlert.swift
//  Ddungja
//
//  Created by 오승기 on 2023/08/11.
//

import Combine
import SwiftUI

enum AlertType {
    case error(title: String, message: String = "", icon: String = "", iconColor: String = "")
    
    var title: String {
        switch self {
        case let .error(title, _ , _, _):
            return title
        }
    }

    var message:String {
        switch self {
        case let .error(_, message, _, _):
            return message
        }
    }
    
    var icon: String {
        switch self {
        case let .error(_, _, icon, _):
            return icon
        }
    }
    
    var iconColor: String {
        switch self {
        case let .error(_, _, _, iconColor):
            return iconColor
        }
    }
    
    var leftActionText: String {
        switch self {
        case .error:
            return "확인"
        }
    }
    
    func height(isShowVerticalButtons: Bool = false) -> CGFloat {
        switch self {
        case .error:
            return isShowVerticalButtons ? 220 : 180
        }
    }
}

struct CustomAlert: View {
    
    @Binding var presentAlert: Bool
    @State var alertType: AlertType = .error(title: "")
    
    var coordinator: CoordinatorProtocol
    var isShowVerticalButtons = false
    
    var leftButtonAction: (() -> ())?
    var rightButtonAction: (() -> ())?
    
    let verticalButtonsHeight: CGFloat = 80
    
    var body: some View {
        
        ZStack {
            Color.black.opacity(0.75)
                .edgesIgnoringSafeArea(.all)
            VStack(spacing: 0) {
                if alertType.icon != "" {
                    Image(systemName: alertType.icon)
                        .foregroundColor(Color(hex: alertType.iconColor))
                        .padding(.top, 15)
                }
                if alertType.title != "" {
                    Text(alertType.title)
                        .applyTitle(color: .mainTextColor)
                        .bold()
                        .multilineTextAlignment(.center)
                        .frame(height: 25)
                        .padding(.top, 10)
                        .padding(.bottom, 8)
                        .padding(.horizontal, 16)
                }

                Text(alertType.message)
                    .applySubhead(color: .mainTextColor)
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 16)
                    .padding(.bottom, 16)
                    .minimumScaleFactor(0.5)
                
                Divider()
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 0.5)
                    .padding(.all, 0)
                
                
                    Button {
                        coordinator.pop()
                    } label: {
                        Text(alertType.leftActionText)
                            .applyInner(color: .mainColor)
                            .bold()
                            .multilineTextAlignment(.center)
                            .padding()
                            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                    }
            }
            .frame(width: 270, height: alertType.height(isShowVerticalButtons: isShowVerticalButtons))
            .background(Color.white)
            .cornerRadius(4)
        }
        .zIndex(2)
    }
}
