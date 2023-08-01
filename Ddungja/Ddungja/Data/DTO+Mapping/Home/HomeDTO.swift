//
//  HomeDTO.swift
//  Ddungja
//
//  Created by 오승기 on 2023/08/01.
//

import Foundation

struct HomeDTO: Decodable {
    let posts: [PostsInfoDTO]?
    let totalPages: Int?
}

struct PostsInfoDTO: Decodable {
    let id: Int?
    let subCategory: String?
    let thumbnailImage: String?
    let region: String?
    let genderType: String?
    let age: Int?
    let money: Int?
    let isLike: Bool?
    let createdDate: String?
}

extension HomeDTO {
    func toHomeVO() -> HomeVO {
        guard let posts = posts else {
            return HomeVO(postsInfo: [], totalPages: -1)
        }
        var info = [PostsInfoVO]()
        for post in posts {
            info.append(
                PostsInfoVO(
                    id: post.id ?? -1,
                    subCategory: post.subCategory ?? "Unknown",
                    thumbnailImage: post.thumbnailImage ?? "Unknown",
                    region: post.region ?? "Unknown",
                    genderType: post.genderType ?? "Unknown",
                    age: post.age ?? -1,
                    money: post.money ?? -1,
                    isLike: post.isLike ?? false,
                    createdDate: post.createdDate ?? "Unknown"
                )
            )
        }
        return HomeVO(postsInfo: info, totalPages: totalPages ?? -1)
    }
}
