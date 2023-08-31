//
//  MyEditPostsVO.swift
//  Ddungja
//
//  Created by 오승기 on 2023/07/16.
//

import Foundation

struct MyEditPostsVO {
    let content: [EditPostsInfoVO]
    let pageable: EditPageInfoVO
    let totalPage: Int
}

struct EditPostsInfoVO {
    let postId: Int
    let name: String
    let thumbnailImage: String
    let subCategory: String
    let region: String
    let gender: String
    let birth: String
    let like: Int
    let createdDate: String
    let status: String
}

struct EditPageInfoVO {
    let pageNumber: Int
}

extension EditPostsInfoVO: Equatable {
    static func == (lhs: EditPostsInfoVO, rhs: EditPostsInfoVO) -> Bool {
        return lhs.postId == rhs.postId
    }
}
