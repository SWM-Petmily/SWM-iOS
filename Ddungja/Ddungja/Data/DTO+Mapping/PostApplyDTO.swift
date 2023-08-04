//
//  PostApplyDTO.swift
//  Ddungja
//
//  Created by 오승기 on 2023/08/04.
//

import Foundation

struct PostApplyDTO: Decodable {
    let applyId: Int?
}

extension PostApplyDTO {
    func toApplyIdVO() -> ApplyIDInfoVO {
        return ApplyIDInfoVO(applyId: applyId ?? -1)
    }
}
