//
//  RegisteredPetDTO.swift
//  Ddungja
//
//  Created by 오승기 on 2023/08/05.
//

import Foundation

struct RegisteredPetDTO: Decodable {
    let content: [RegisteredPetInfo]?
}

struct RegisteredPetInfo: Decodable {
    let id: Int?
    let petName: String?
    let petType: String?
    let petGender: String?
    let petNeutered: String?
}

extension RegisteredPetDTO {
    func toRegisteredPetVO() -> [RegisteredPetVO] {
        guard let contents = content else {
            return []
        }
        var vo = [RegisteredPetVO]()
        for content in contents {
            vo.append(
                RegisteredPetVO(
                    id: content.id ?? -1,
                    petName: content.petName ?? "Unknown",
                    petType: content.petType ?? "Unknown",
                    petGender: content.petGender ?? "Unknown",
                    petNeutered: content.petNeutered ?? "Unknown"
                )
            )
        }
        return vo
    }
}
