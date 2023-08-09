//
//  RegisterPetNumberDTO.swift
//  Ddungja
//
//  Created by 오승기 on 2023/08/10.
//

import Foundation

struct RegisterPetNumberDTO: Encodable {
    let ownerName: String
    let dogRegistrationNumber: String
}
