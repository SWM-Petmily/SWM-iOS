//
//  UserInfoDTO.swift
//  Ddungja
//
//  Created by 오승기 on 2023/06/22.
//

import Foundation

struct UserInfoDTO: Decodable {
    let accessToken: String
    let refreshToken: String
}
