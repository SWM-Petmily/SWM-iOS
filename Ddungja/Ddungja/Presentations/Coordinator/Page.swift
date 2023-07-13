//
//  Page.swift
//  Ddungja
//
//  Created by 오승기 on 2023/07/13.
//

import SwiftUI

enum Page: Hashable {
    case myPageView
    case userProfileView
    case editProfile
    
    @ViewBuilder
    func getView(coordinator: CoordinatorProtocol, viewResolver: ViewResolverProtocol) -> some View {
        switch self {
        case .userProfileView:
            viewResolver.resolveView(UserProfileView.self)
        case .myPageView:
            viewResolver.resolveView(MyPageVIew.self)
        case .editProfile:
            viewResolver.resolveView(EditProfile.self)
        }
    }
}
