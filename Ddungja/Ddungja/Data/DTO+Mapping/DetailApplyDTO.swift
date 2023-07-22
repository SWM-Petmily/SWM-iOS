//
//  DetailApplyDTO.swift
//  Ddungja
//
//  Created by 오승기 on 2023/07/22.
//

import Foundation

struct DetailApplyDTO: Decodable {
    let applyId: Int?
    let nickname: String?
    let job: String?
    let environment: String?
    let people: Int?
    let comment: String?
    let region: String?
    let isExperience: Bool?
    let url: String?
    let openTalk: String?
    let approval: String?
    let applyExperiences: [ApplyExperiencs]?
    let isMyApply: Bool?
}

struct ApplyExperiencs: Decodable {
    let species: String
    let period: Int
}

extension DetailApplyDTO {
    func toDetailApplyVO() -> DetailApplyVO {
        var experiences = [ApplyExperiencsVO]()
        if let applyExperiences = applyExperiences {
            for experience in applyExperiences {
                experiences.append(
                    ApplyExperiencsVO(
                        species: experience.species,
                        period: experience.period
                    )
                )
            }
        }
        
        return DetailApplyVO(
            applyId: applyId ?? -1,
            nickname: nickname ?? "뚱자쓰",
            job: job ?? "-",
            environment: environment ?? "-",
            people: people ?? 0,
            comment: comment ?? "",
            region: region ?? "",
            isExperience: isExperience ?? false,
            url: url ?? "",
            openTalk: openTalk ?? "",
            approval: approval ?? "",
            applyExperiences: experiences,
            isMyApply: isMyApply ?? false)
    }
}
