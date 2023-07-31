//
//  Coordinator.swift
//  Ddungja
//
//  Created by 오승기 on 2023/07/13.
//

import Combine
import SwiftUI

protocol CoordinatorProtocol {
    func push(_ page: Page)
    func pop()
}

final class Coordinator: ObservableObject, CoordinatorProtocol {
    @Published var path: NavigationPath

    private var page: Page
    var injector: Injector?
    
    init(_ page: Page) {
        self.page = page
        self.path = NavigationPath()
    }
    
    func initScene() -> some View {
        return make(page)
    }
    
    func push(_ page: Page) {
        path.append(page)
    }
    
    func pop() {
        path.removeLast()
    }
    
    @ViewBuilder
    func make(_ page: Page) -> some View {
        switch page {
        case .myPageView:
            injector?.resolve(MyPageVIew.self)
        case .userProfileView:
            injector?.resolve(UserProfileView.self)
        case .editProfile:
            injector?.resolve(EditProfile.self)
        case .myPosts:
            injector?.resolve(MyPostsView.self)
        case .myApplyPosts:
            injector?.resolve(MyApplyPostsView.self)
        case .applyList:
            injector?.resolve(ApplyListView.self)
        case .detailApply:
            injector?.resolve(DetailApplyView.self)
        case .applyModify:
            injector?.resolve(ApplyModifyVIew.self)
        case .login:
            injector?.resolve(LoginView.self)
        case .tapBar:
            injector?.resolve(DdungjaTabView.self)
        case .signup:
            injector?.resolve(SignUpView.self)
        }
    }
}
