//
//  LoginDTO.swift
//  Ddungja
//
//  Created by 오승기 on 2023/06/21.
//

import Foundation

struct LoginDTO: Decodable {
    let userId: Int?
    let accessToken: String?
    let refreshToken: String?
    let isCertification: Bool?
}

extension LoginDTO {
    func toLoginVO() -> LoginVO {
        return LoginVO(
            userId: userId ?? -1,
            accessToken: accessToken ?? "",
            refreshToken: refreshToken ?? "",
            isCertification: isCertification ?? false
        )
    }
}
