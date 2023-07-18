//
//  MyEditPostsVO.swift
//  Ddungja
//
//  Created by 오승기 on 2023/07/16.
//

import Foundation

struct MyEditPostsVO {
    let content: [PostsInfoVO]
    let pageable: PageInfo
    let totalPage: Int
}

struct PostsInfoVO {
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
}

struct PageInfoVO {
    let pageNumber: Int
}

extension PostsInfoVO: Equatable {
    static func == (lhs: PostsInfoVO, rhs: PostsInfoVO) -> Bool {
        return lhs.postId == rhs.postId
    }
}
