//
//  DeleteInfoDTO.swift
//  Ddungja
//
//  Created by 오승기 on 2023/07/23.
//

import Foundation

struct DeleteInfoDTO: Decodable {
    let applyId: Int?
}

extension DeleteInfoDTO {
    func toInfoVO() -> ApplyIDInfoVO {
        return ApplyIDInfoVO(applyId: applyId ?? -1)
    }
}
