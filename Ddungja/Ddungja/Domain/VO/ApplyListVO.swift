//
//  ApplyListVO.swift
//  Ddungja
//
//  Created by 오승기 on 2023/07/21.
//

import Foundation

struct ApplyListVO {
    let content: [ApplyListInfoVO]
    let pageable: ApplyListPageInfoVO
    let totalPages: Int
}

struct ApplyListInfoVO {
    let applyId: Int
    let approval: String
    let job: String
    let environment: String
    let people: Int
    let comment: String
    let region: String
    let nickname: String
    let isExperience: Bool
}

struct ApplyListPageInfoVO {
    let pageNumber: Int
}

extension ApplyListInfoVO: Equatable {
    static func == (lhs: ApplyListInfoVO, rhs: ApplyListInfoVO) -> Bool {
        return lhs.applyId == rhs.applyId
    }
}
