//
//  MyApplyPostsDTO.swift
//  Ddungja
//
//  Created by 오승기 on 2023/07/20.
//

import Foundation

struct MyApplyPostsDTO: Decodable {
    let content: [ApplyPostsInfo]?
    let pageable: ApplyPageInfo?
    let totalPages: Int?
}

struct ApplyPostsInfo: Decodable {
    let applyId: Int
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
    let age: Int
}

struct ApplyPageInfo: Decodable {
    let pageNumber: Int
}

extension MyApplyPostsDTO {
    func toApplyPostsVO() -> MyApplyPostsVO {
        guard let contents = content, let page = pageable, let totalPage = totalPages else {
            return MyApplyPostsVO(content: [], pageable: ApplyPageInfoVO(pageNumber: 0), totalPage: 0)
        }
        
        var postInfoVO: [ApplyPostsInfoVO] = []
        for content in contents {
            let imageURL = URL(string: content.thumbnailImage)!
            postInfoVO.append(
                ApplyPostsInfoVO(
                    applyId: content.applyId,
                    postId: content.postId,
                    name: content.name,
                    thumbnailImage: imageURL,
                    subCategory: content.subCategory,
                    region: content.region,
                    gender: content.gender,
                    birth: content.birth,
                    like: content.like,
                    createdDate: content.createdDate,
                    status: content.status,
                    age: content.age
                )
            )
        }
        
        return MyApplyPostsVO(content: postInfoVO, pageable: ApplyPageInfoVO(pageNumber: page.pageNumber), totalPage: totalPage)
    }
}
