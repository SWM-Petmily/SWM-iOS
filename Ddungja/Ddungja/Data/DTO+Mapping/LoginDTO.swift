//
//  LoginDTO.swift
//  Ddungja
//
//  Created by 오승기 on 2023/06/21.
//

import Foundation

struct LoginDTO: Decodable {
    let status: Int
    let email: String
    let socialId: Int
    let socialType: String
    let accessToken: String?
    let refreshToken: String?
}
