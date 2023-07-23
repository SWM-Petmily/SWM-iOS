//
//  AcceptInfoDTO.swift
//  Ddungja
//
//  Created by 오승기 on 2023/07/23.
//

import Foundation

struct AcceptInfoDTO: Encodable {
    let approval: String
}

struct AcceptInfoResponseDTO: Decodable {
    let applyId: Int?
    let approval: String?
}

extension AcceptInfoResponseDTO {
    func toAcceptInfoResponseVO() -> AcceptInfoResponseVO {
        return AcceptInfoResponseVO(
            applyId: applyId ?? -1,
            approval: approval ?? "APPROVED"
        )
    }
}
