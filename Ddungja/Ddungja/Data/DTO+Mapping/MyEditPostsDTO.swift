//
//  MyEditPostsDTO.swift
//  Ddungja
//
//  Created by 오승기 on 2023/07/16.
//

import Foundation

struct MyEditPostsDTO: Decodable {
    let content: [EditPostsInfo]?
    let pageable: EditPageInfo?
    let totalPages: Int?
}

struct EditPostsInfo: Decodable {
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

struct EditPageInfo: Decodable {
    let pageNumber: Int
}

extension MyEditPostsDTO {
    func toEditPostsVO() -> MyEditPostsVO {
        guard let contents = content, let page = pageable, let totalPage = totalPages else {
            return MyEditPostsVO(content: [], pageable: EditPageInfoVO(pageNumber: 0), totalPage: 0)
        }
        
        var postInfoVO: [EditPostsInfoVO] = []
        for content in contents {
            let imageURL = URL(string: content.thumbnailImage)!
            postInfoVO.append(
                EditPostsInfoVO(
                    postId: content.postId,
                    name: content.name,
                    thumbnailImage: imageURL,
                    subCategory: content.subCategory,
                    region: content.region,
                    gender: content.gender,
                    birth: content.birth,
                    like: content.like,
                    createdDate: content.createdDate,
                    status: content.status
                )
            )
        }
        
        return MyEditPostsVO(content: postInfoVO, pageable: EditPageInfoVO(pageNumber: page.pageNumber), totalPage: totalPage)
    }
}
