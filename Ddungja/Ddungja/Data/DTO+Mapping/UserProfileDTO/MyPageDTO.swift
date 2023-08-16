//
//  MyPageDTO.swift
//  Ddungja
//
//  Created by 오승기 on 2023/08/16.
//

import Foundation

struct MyPageDTO: Decodable {
    let nickname: String?
    let isProfile: Bool?
    let likeCount: Int?
    let applyCount: Int?
    let imageUrl: String?
}

extension MyPageDTO {
    func toMyPageVO() -> MyPageVO {
        return MyPageVO(nickname: nickname ?? "",
                        isProfile: isProfile ?? false,
                        likeCount: likeCount ?? -1,
                        applyCount: applyCount ?? -1,
                        imageUrl: imageUrl ?? "")
    }
}
