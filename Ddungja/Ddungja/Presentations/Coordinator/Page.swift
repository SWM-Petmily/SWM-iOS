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
    case editProfile(isRegister: Bool)
    case myPosts
    case myApplyPosts
    case applyList(id: Int) //지원받은 목록보기
    case detailApply(id: Int) //지원하기 상세페이지
    case applyModify(id: Int)
    case login
    case tapBar
    case signup
    case home
    case detailPost(id: Int) //상세게시글페이지
    case applyAdaption(postId: Int)
    case petInfo(info: RegisteredPetVO)
    case adoptionReason
    case registerScene
    case petAdvantage
    case petDisadvantage
    case petCost
    case petAdopter
    case petCertification(postId: Int)
    case petRegistration(postId: Int?)
    case healthScreening(postId: Int)
    case vaccination(postId: Int)
}
