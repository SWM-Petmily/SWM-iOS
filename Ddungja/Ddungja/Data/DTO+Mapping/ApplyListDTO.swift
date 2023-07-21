//
//  ApplyListDTO.swift
//  Ddungja
//
//  Created by 오승기 on 2023/07/21.
//

import Foundation

struct ApplyListDTO: Decodable {
    let content: [ApplyInfo]?
    let pageable: ApplyListPageInfo?
    let totalPages: Int?

}

struct ApplyInfo: Decodable {
    let applyId, userId, sellerId: Int
    let approval: String
    let job: String
    let environment: String
    let people: Int
    let comment: String
    let openTalk: String
    let region: String
    let isExperience: Bool
    let url: String
    let applyExperiences: [ApplyExperience]
}

struct ApplyExperience: Decodable {
    let species: String
    let period: Int
}

struct ApplyListPageInfo: Decodable {
    let pageNumber: Int
}
