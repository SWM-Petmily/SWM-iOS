//
//  MyPageVO.swift
//  Ddungja
//
//  Created by 오승기 on 2023/08/16.
//

import Foundation

struct MyPageVO: Decodable {
    let nickname: String
    let isProfile: Bool
    let likeCount: Int
    let applyCount: Int
    let imageUrl: String
}
