//
//  RegisterPostDTO.swift
//  Ddungja
//
//  Created by 오승기 on 2023/08/09.
//

import Foundation

struct RegisterPostDTO: Decodable {
    let postId: Int?
}

extension RegisterPostDTO {
    func toPostIdVO() -> RegisterPostIDVO {
        return RegisterPostIDVO(postId: postId ?? -1)
    }
}
