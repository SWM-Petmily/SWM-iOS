//
//  HomeVO.swift
//  Ddungja
//
//  Created by 오승기 on 2023/08/01.
//

import Foundation

struct HomeVO {
    let postsInfo: [PostsInfoVO]
    let totalPages: Int
}
struct PostsInfoVO {
    let id: Int
    let name: String
    let subCategory: String
    let thumbnailImage: String
    let region: String
    let genderType: String
    let age: Int
    let money: Int
    let isLike: Bool
    let createdDate: String
}
