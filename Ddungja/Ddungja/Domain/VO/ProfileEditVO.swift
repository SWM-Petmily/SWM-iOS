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
    let experiences: [(id: String, species: String, period: Int)]
}

extension ProfileEditVO {
    func toData(profile: ProfileEditVO) -> ProfileEditReqiestDTO {
        let convertedExperiences = self.experiences.map { experience in
            return Experiences(species: experience.species, period: experience.period)
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
