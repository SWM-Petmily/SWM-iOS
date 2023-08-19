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
    func popToRoot()
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
    
    func popToRoot() {
        path.removeLast(path.count - 1)
    }
    
    @ViewBuilder
    func make(_ page: Page) -> some View {
        switch page {
        case .myPageView:
            injector.resolve(MyPageScene.self)
        case .userProfileView:
            injector.resolve(UserProfileView.self)
        case let .editProfile(isRegister):
            injector.resolve(EditProfile.self, argument: isRegister)
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
        case let .applyAdaption(postId):
            injector.resolve(ApplyAdoptionView.self, argument: postId)
        case let .petInfo(info):
            injector.resolve(PetInfoView.self, argument: info)
        case .adoptionReason:
            injector.resolve(AdoptionReasonView.self)
        case .registerScene:
            injector.resolve(RegisterScene.self)
        case .petAdvantage:
            injector.resolve(PetAdvantageView.self)
        case .petDisadvantage:
            injector.resolve(PetDisadvantageView.self)
        case .petCost:
            injector.resolve(PetCostView.self)
        case .petAdopter:
            injector.resolve(PetAdopterView.self)
        case let .petCertification(postId):
            injector.resolve(PetCertificationScene.self, argument: postId)
        case let .petRegistration(postId):
            injector.resolve(PetRegistrationView.self, argument: postId)
        case let .healthScreening(postId):
            injector.resolve(HealthScreeningView.self, argument: postId)
        case let .vaccination(postId):
            injector.resolve(VaccinationView.self, argument: postId)
        case .likeList:
            injector.resolve(LikeListScene.self)
        }
    }
}
