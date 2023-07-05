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
    
    init(job: String, environment: String, people: Int, comment: String, openTalk: String, region: String, isExperience: Bool, user: UserVO, profileImage: ProfileImageVO, experiences: [FeedExperiencesVO]) {
        self.job = job
        self.environment = environment
        self.people = people
        self.comment = comment
        self.openTalk = openTalk
        self.region = region
        self.isExperience = isExperience
        self.user = user
        self.profileImage = profileImage
        self.experiences = experiences
    }
}

struct UserVO {
    let email: String
    let nickname: String
    let birth: String
    let phone: String
    let provider: String
    let profile: Bool
    
    init(email: String, nickname: String, birth: String, phone: String, provider: String, profile: Bool) {
        self.email = email
        self.nickname = nickname
        self.birth = birth
        self.phone = phone
        self.provider = provider
        self.profile = profile
    }
}

struct ProfileImageVO {
    let url: String
    
    init(url: String) {
        self.url = url
    }
}

struct FeedExperiencesVO {
    let id: Int
    let species: String
    let period: Int
    
    init(id: Int, species: String, period: Int) {
        self.id = id
        self.species = species
        self.period = period
    }
}
