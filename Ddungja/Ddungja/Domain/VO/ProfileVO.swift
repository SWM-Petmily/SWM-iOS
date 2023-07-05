//
//  ProfileVO.swift
//  Ddungja
//
//  Created by 오승기 on 2023/07/05.
//

import Foundation

struct ProfileVO {
    let job: String
    let environment: String
    let people: Int
    let comment: String
    let openTalk: String
    let region: String
    let isExperience: Bool
    let user: UserVO
    let profileImage: ProfileImageVO
    let experiences: [FeedExperiencesVO]
}

struct UserVO {
    let email: String
    let nickname: String
    let birth: String
    let phone: String
    let provider: String
    let profile: Bool
}

struct ProfileImageVO {
    let url: String
}

struct FeedExperiencesVO {
    let id: Int
    let species: String
    let period: Int
}
