//
//  ApplyDTO.swift
//  Ddungja
//
//  Created by 오승기 on 2023/08/13.
//

import Foundation

struct ApplyDTO: Encodable {
    let profileImageId: Int
    let job: String
    let environment: String
    let people: Int
    let comment: String
    let openTalk: String
    let region: String
    let isExperience: Bool
    let url: String
    let experiences: [ApplyDTOExperiences]
}

struct ApplyDTOExperiences: Encodable {
    let species: String
    let period: Int
}
