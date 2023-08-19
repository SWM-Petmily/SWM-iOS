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
    let openTalk: String
    let region: String
    let isExperience: Bool
    let user: User
    let profileImage: ProfileImage
    let experiences: [Experience]
    let isMyProfile: Bool
}

struct User: Decodable {
    let email: String
    let nickname: String
    let phone: String
    let provider: String
    let isProfile: Bool
}

struct ProfileImage: Decodable {
    let id: Int?
    let url: String
}

struct Experience: Decodable {
    let id: Int?
    let species: String
    let period: Int
}

extension ProfileDetailDTO {
    func toDomain() -> ProfileVO {
        let nickname = user.nickname
        var experiencesArray = [(id: String, species: String, period: Int)]()
        for experience in experiences {
            let id = experience.id == nil ? UUID().uuidString : String(experience.id!)
            let species = experience.species
            let period = experience.period
            experiencesArray.append((id: id, species: species, period: period))
        }
        return ProfileVO(job: job, environment: environment, people: people, comment: comment, openTalk: openTalk, region: region, isExperience: isExperience, nickname: nickname, profileImageId: profileImage.id ?? 1, profileImage: profileImage.url, experiences: experiencesArray, isMyProfile: isMyProfile)
    }
}
