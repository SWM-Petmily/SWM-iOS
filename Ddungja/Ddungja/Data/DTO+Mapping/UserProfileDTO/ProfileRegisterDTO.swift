//
//  ProfileRegisterDTO.swift
//  Ddungja
//
//  Created by 오승기 on 2023/06/28.
//

import Foundation

struct ProfileRegisterDTO: Decodable {
    let profileId: Int
}

struct ProfileEditReqiestDTO: Encodable {
    let job: String
    let environment: String
    let people: Int
    let comment: String
    let openTalk: String
    let region: String
    let isExperience: Bool
    let profileImageId: Int
    let experiences: [Experiences]
}

struct Experiences: Encodable {
    let id: Int
    let species: String
    let period: Int
}