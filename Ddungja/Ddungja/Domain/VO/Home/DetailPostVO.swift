//
//  DetailPostVO.swift
//  Ddungja
//
//  Created by 오승기 on 2023/08/03.
//

import Foundation

struct DetailPostVO {
    let postId, writerId, level: Int
    let writer: String
    let writerProfileImage: Int
    let mainCategory, subCategory, name, gender: String
    let region: String
    let age: Int
    let registered, vaccinated, medicalChecked, neutered: String
    let diseases: [String]
    let money: Int
    let reason, advantage, disadvantage, averageCost: String
    let adopter, status: String
    let images: [PetImagesVO]
    let isWriter, isLike, isApply: Bool
    let likeCount: Int
}

struct PetImagesVO {
    let url: String
}
