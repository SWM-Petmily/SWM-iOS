//
//  LikeListVO.swift
//  Ddungja
//
//  Created by 오승기 on 2023/08/18.
//

import Foundation

struct LikeListVO {
    let content: [LikeListInfoVO]
    let pageable: LikeListPageInfoVO
    let totalPages: Int
}

struct LikeListInfoVO {
    let id: Int
    let name: String
    let thumbnailImage: URL
    let subCategory: String
    let region: String
    let gender: String
    let birth: String
    let like: Int
    let isMine: Bool
    let createdDate: String
    let postStatus: String
}

struct LikeListPageInfoVO {
    let pageNumber: Int
}

extension LikeListInfoVO: Equatable {
    static func == (lhs: LikeListInfoVO, rhs: LikeListInfoVO) -> Bool {
        return lhs.id == rhs.id
    }
}
