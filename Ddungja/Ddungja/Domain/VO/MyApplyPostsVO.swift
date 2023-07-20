//
//  MyApplyPostsVO.swift
//  Ddungja
//
//  Created by 오승기 on 2023/07/20.
//

import Foundation

struct MyApplyPostsVO {
    let content: [ApplyPostsInfoVO]
    let pageable: ApplyPageInfoVO
    let totalPage: Int
}

struct ApplyPostsInfoVO {
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
    let status: String
    let age: Int
}

struct ApplyPageInfoVO {
    let pageNumber: Int
}

extension ApplyPostsInfoVO: Equatable {
    static func == (lhs: ApplyPostsInfoVO, rhs: ApplyPostsInfoVO) -> Bool {
        return lhs.applyId == rhs.applyId
    }
}
