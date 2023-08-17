//
//  RegisterPetIdDTO.swift
//  Ddungja
//
//  Created by 오승기 on 2023/08/17.
//

import Foundation

struct RegisterPetIdDTO: Decodable {
    let registerId: Int?
}

extension RegisterPetIdDTO {
    func toRegisterPetIdVO() -> RegisterPetIdVO {
        return RegisterPetIdVO(registerId: registerId ?? -1)
    }
}
