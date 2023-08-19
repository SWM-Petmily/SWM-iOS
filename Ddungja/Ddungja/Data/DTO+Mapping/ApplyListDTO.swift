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
    let applyId: Int
    let approval: String
    let url: String
    let job: String
    let environment: String
    let people: Int
    let comment: String
    let region: String
    let nickname: String
    let isExperience: Bool
}

struct ApplyListPageInfo: Decodable {
    let pageNumber: Int
}

extension ApplyListDTO {
    func toApplyListVO() -> ApplyListVO {
        guard let contents = content, let page = pageable, let totalPages = totalPages else {
            return ApplyListVO(content: [], pageable: ApplyListPageInfoVO(pageNumber: 0), totalPages: 0)
        }
        
        var applyListInfoVO: [ApplyListInfoVO] = []
        
        for content in contents {
            
            applyListInfoVO.append(
                ApplyListInfoVO(
                    applyId: content.applyId,
                    approval: content.approval,
                    url: content.url,
                    job: content.job,
                    environment: content.environment,
                    people: content.people,
                    comment: content.comment,
                    region: content.region,
                    nickname: content.nickname,
                    isExperience: content.isExperience
                )
            )
        }
        
        return ApplyListVO(content: applyListInfoVO, pageable: ApplyListPageInfoVO(pageNumber: page.pageNumber), totalPages: totalPages)
    }
}
