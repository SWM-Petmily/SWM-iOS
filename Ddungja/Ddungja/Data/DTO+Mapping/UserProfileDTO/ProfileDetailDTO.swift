//
//  ProfileDetailDTO.swift
//  Ddungja
//
//  Created by 오승기 on 2023/06/28.
//

import Foundation

struct ProfileDetailDTO: Decodable {
    let job: String
    let environment: String
    let people: Int
    let comment: String
    let color: String
    let openTalk: String
    let region: String
    let isExperience: Bool
    let user: User
    let profileImage: ProfileImage
    let experiences: [Experience]
}

struct User: Decodable {
    let email: String
    let nickname: String
    let birth: String
    let phone: String
    let provider: String
    let profile: Bool
}

struct ProfileImage: Decodable {
    let url: String
}

struct Experience: Decodable {
    let id: Int?
    let species: String?
    let period: Int?
}
