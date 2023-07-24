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
    case myPosts
    case myApplyPosts
    case applyList(id: Int) //지원받은 목록보기
    case detailApply(id: Int) //지원하기 상세페이지
    case applyModify(id: Int)
    
    @ViewBuilder
    func getView(coordinator: CoordinatorProtocol, viewResolver: ViewResolverProtocol) -> some View {
        switch self {
        case .userProfileView:
            viewResolver.resolveView(UserProfileView.self)
        case .myPageView:
            viewResolver.resolveView(MyPageVIew.self)
        case .editProfile:
            viewResolver.resolveView(EditProfile.self)
        case .myPosts:
            viewResolver.resolveView(MyPostsView.self)
        case .myApplyPosts:
            viewResolver.resolveView(MyApplyPostsView.self)
        case let .applyList(id):
            viewResolver.resolve(ApplyListView.self, argument: id)
        case let .detailApply(id):
            viewResolver.resolve(DetailApplyView.self, argument: id)
        case let .applyModify(id):
            viewResolver.resolve(ApplyModifyVIew.self, argument: id)
        }
    }
}
