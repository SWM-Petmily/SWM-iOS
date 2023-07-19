//
//  MyApplyPostsDTO.swift
//  Ddungja
//
//  Created by 오승기 on 2023/07/18.
//

import Foundation

struct MyApplyPostsDTO: Decodable {
    let content: [ApplyInfo]?
    let pageable: PageInfo?
    let totalPages: Int?
}

struct ApplyInfo: Decodable {
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
    let approval: String
}

extension MyApplyPostsDTO {
    func toApplyPostsVO() -> MyApplyPostsVO {
        guard let contents = content,
              let page = pageable,
              let totalPage = totalPages else {
            return MyApplyPostsVO(content: [], pageable: PageInfoVO(pageNumber: 0), totalPages: 0)
        }
        var applyInfoVO = [ApplyInfoVO]()
        
        for content in contents {
            let imageURL = URL(string: content.thumbnailImage)!
            applyInfoVO.append(
                ApplyInfoVO(
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
                    approval: content.approval
                )
            )
        }
        
        return MyApplyPostsVO(
            content: applyInfoVO,
            pageable: PageInfoVO(pageNumber: page.pageNumber),
            totalPages: totalPage
        )
    }
}

