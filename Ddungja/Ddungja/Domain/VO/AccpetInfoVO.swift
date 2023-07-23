//
//  AccpetInfoVO.swift
//  Ddungja
//
//  Created by 오승기 on 2023/07/23.
//

import Foundation

struct AccpetInfoVO {
    let approval: String
}

struct AcceptInfoResponseVO {
    let applyId: Int
    let approval: String
}

extension AccpetInfoVO {
    func toAccpetInfoDTO() -> AcceptInfoDTO {
        return AcceptInfoDTO(approval: approval)
    }
}
