//
//  ProfileEditVO.swift
//  Ddungja
//
//  Created by 오승기 on 2023/07/07.
//

import Foundation

struct ProfileEditVO {
    let job: String
    let environment: String
    let people: Int
    let comment: String
    let openTalk: String
    let region: String
    let isExperience: Bool
    let profileImageId: Int
    let experiences: [(id: Int, species: String, period: Int)]

    init(job: String, environment: String, people: Int, comment: String, openTalk: String, region: String, isExperience: Bool, profileImageId: Int, experiences: [(id: Int, species: String, period: Int)]) {
        self.job = job
        self.environment = environment
        self.people = people
        self.comment = comment
        self.openTalk = openTalk
        self.region = region
        self.isExperience = isExperience
        self.profileImageId = profileImageId
        self.experiences = experiences
    }
}

extension ProfileEditVO {
    func toData(profile: ProfileEditVO) -> ProfileEditReqiestDTO {
        let convertedExperiences = self.experiences.map { experience in
            return Experiences(id: experience.id, species: experience.species, period: experience.period)
        }
        
        return ProfileEditReqiestDTO(
            job: profile.job,
            environment: profile.environment,
            people: profile.people,
            comment: profile.comment,
            openTalk: profile.openTalk,
            region: profile.region,
            isExperience: profile.isExperience,
            profileImageId: profile.profileImageId,
            experiences: convertedExperiences
        )
    }
}
