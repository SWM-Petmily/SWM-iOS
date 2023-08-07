//
//  PetPostVO.swift
//  Ddungja
//
//  Created by 오승기 on 2023/08/07.
//

import Foundation

//게시물 등록을 통해 작성한 애완동물 정보
struct PetPostVO: Encodable, Hashable {
    let mainCategory: String
    let subCategory: String
    let name: String
    let region: String
    let gender: String
    let birth: String
    let neutered: String
    let money: Int
    let reason: String
    let advantage: String
    let disadvantage: String
    let averageCost: String
    let adopter: String
    let status: String
    let diseases: [PetDisease]
    let isRegistered: Bool
    
    init(mainCategory: String, subCategory: String, name: String, region: String, gender: String, birth: String, neutered: String, money: Int, reason: String, advantage: String, disadvantage: String, averageCost: String, adopter: String, status: String, diseases: [PetDisease], isRegistered: Bool) {
        self.mainCategory = mainCategory
        self.subCategory = subCategory
        self.name = name
        self.region = region
        self.gender = gender
        self.birth = birth
        self.neutered = neutered
        self.money = money
        self.reason = reason
        self.advantage = advantage
        self.disadvantage = disadvantage
        self.averageCost = averageCost
        self.adopter = adopter
        self.status = status
        self.diseases = diseases
        self.isRegistered = isRegistered
    }
}

struct PetDisease: Encodable, Hashable {
    let name: String
}

