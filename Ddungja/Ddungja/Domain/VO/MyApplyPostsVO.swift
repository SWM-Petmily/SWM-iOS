//
//  MyApplyPostsVO.swift
//  Ddungja
//
//  Created by 오승기 on 2023/07/18.
//

import Foundation

struct MyApplyPostsVO {
    let content: [ApplyInfoVO]
    let pageable: PageInfoVO
    let totalPages: Int
}

struct ApplyInfoVO {
    let applyId: Int
    let postId: Int
    let name: String
    let thumbnailImage: URL
    let subCategory: String
    let region: String
    let gender: String
    let birth: String
    let like: Int
    let createdDate: String
    let approval: String
}

extension ApplyInfoVO: Equatable {
    static func == (lhs: ApplyInfoVO, rhs: ApplyInfoVO) -> Bool {
        return lhs.applyId == rhs.applyId
    }
}
