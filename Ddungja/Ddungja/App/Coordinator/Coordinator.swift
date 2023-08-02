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
    private var injector: Injector
    
    init(_ page: Page, _ injector: Injector) {
        self.page = page
        self.path = NavigationPath()
        self.injector = injector
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
            injector.resolve(MyPageScene.self)
        case .userProfileView:
            injector.resolve(UserProfileView.self)
        case .editProfile:
            injector.resolve(EditProfile.self)
        case .myPosts:
            injector.resolve(MyPostsScene.self)
        case .myApplyPosts:
            injector.resolve(MyApplyPostsScene.self)
        case let .applyList(id):
            injector.resolve(ApplyListScene.self, argument: id)
        case let .detailApply(id):
            injector.resolve(DetailApplyView.self, argument: id)
        case let .applyModify(id):
            injector.resolve(ApplyModifyVIew.self, argument: id)
        case .login:
            injector.resolve(LoginScene.self)
        case .tapBar:
            injector.resolve(DdungjaTabScene.self)
        case .signup:
            injector.resolve(SignUpScene.self)
        case .home:
            injector.resolve(HomeScene.self)
        case let .detailPost(id):
            injector.resolve(DetailPostScene.self, argument: id)
        }
    }
}
