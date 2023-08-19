//
//  LikeListDTO.swift
//  Ddungja
//
//  Created by 오승기 on 2023/08/18.
//

import Foundation

struct LikeListDTO: Decodable {
    let content: [LikeListInfo]?
    let pageable: LikeListPageInfo?
    let totalPages: Int?
}

struct LikeListInfo: Decodable {
    let id: Int?
    let name: String?
    let thumbnailImage: String?
    let subCategory: String?
    let region: String?
    let gender: String?
    let birth: String?
    let like: Int?
    let isMine: Bool?
    let createdDate: String?
    let postStatus: String?
}

struct LikeListPageInfo: Decodable {
    let pageNumber: Int
}

extension LikeListDTO {
    func toLikeListVO() -> LikeListVO {
        guard let contents = content, let page = pageable, let totalPage = totalPages else {
            return LikeListVO(content: [], pageable: LikeListPageInfoVO(pageNumber: 0), totalPages: 0)
        }
        
        var infoVO = [LikeListInfoVO]()
        
        for content in contents {
            let imageURL = URL(string: content.thumbnailImage ?? "")!
            
            infoVO.append(
                LikeListInfoVO(
                    id: content.id ?? -1,
                    name: content.name ?? "unknown",
                    thumbnailImage: imageURL,
                    subCategory: content.subCategory ?? "Unknown",
                    region: content.region ?? "서울",
                    gender: content.gender ?? "MALE",
                    birth: content.birth ?? "0",
                    like: content.like ?? -1,
                    isMine: content.isMine ?? false,
                    createdDate: content.createdDate ?? "",
                    postStatus: content.postStatus ?? ""
                )
            )
        }
        return LikeListVO(content: infoVO, pageable: LikeListPageInfoVO(pageNumber: page.pageNumber), totalPages: totalPage)
    }
}
