//
//  DetailApplyVO.swift
//  Ddungja
//
//  Created by 오승기 on 2023/07/22.
//

import Foundation

struct DetailApplyVO {
    let applyId: Int
    let nickname: String
    let job: String
    let environment: String
    let people: Int
    let comment: String
    let region: String
    let isExperience: Bool
    let url: String
    let openTalk: String
    let approval: String
    let applyExperiences: [ApplyExperiencsVO]
    let isMyApply: Bool
}

struct ApplyExperiencsVO {
    let species: String
    let period: Int
}
