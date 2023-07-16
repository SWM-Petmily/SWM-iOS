//
//  MyEditPostsDTO.swift
//  Ddungja
//
//  Created by 오승기 on 2023/07/16.
//

import Foundation

struct MyEditPostsDTO: Decodable {
    let content: [PostsInfo]
    let pageable: PageInfo
}

struct PostsInfo: Decodable {
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

struct PageInfo: Decodable {
    let pageNumber: Int
    let pageSize: Int
}
