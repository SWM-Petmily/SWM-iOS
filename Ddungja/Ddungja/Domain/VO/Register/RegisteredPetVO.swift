//
//  RegisteredPetVO.swift
//  Ddungja
//
//  Created by 오승기 on 2023/08/05.
//

import Foundation

// 동물 등록 정보를 통해 받아온 값
struct RegisteredPetVO: Hashable {
    let id: Int
    let petName: String
    let petType: String
    let petGender: String
    let petNeutered: String
}
