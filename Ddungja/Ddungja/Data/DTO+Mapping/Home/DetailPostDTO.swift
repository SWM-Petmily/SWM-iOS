//
//  DetailPostDTO.swift
//  Ddungja
//
//  Created by 오승기 on 2023/08/03.
//

import Foundation

struct DetailPostDTO: Decodable {
    let postId, writerId, level: Int?
    let writer: String?
    let writerProfileImage: Int?
    let mainCategory, subCategory, name, gender: String?
    let region: String?
    let age: Int?
    let registered, vaccinated, medicalChecked, neutered: String?
    let diseases: [String]?
    let money: Int?
    let reason, advantage, disadvantage, averageCost: String?
    let adopter, status: String?
    let images: [PetImagesDTO]?
    let isWriter, isLike, isApply: Bool?
    let likeCount: Int?
}

struct PetImagesDTO: Decodable {
    let url: String?
}

extension DetailPostDTO {
    func toDetailPostVO() -> DetailPostVO {
        var imagesVO = [PetImagesVO]()
        if let images = images {
            for image in images {
                imagesVO.append(PetImagesVO(url: image.url ?? ""))
            }
        }
        return DetailPostVO(
            postId: postId ?? -1,
            writerId: writerId ?? -1,
            level: level ?? -1,
            writer: writer ?? "Unknown",
            writerProfileImage: writerProfileImage ?? -1,
            mainCategory: mainCategory ?? "Unknown",
            subCategory: subCategory ?? "Unknown",
            name: name ?? "Unknown",
            gender: gender ?? "Unknown",
            region: region ?? "Unknown",
            age: age ?? -1,
            registered: registered ?? "Unknown",
            vaccinated: vaccinated ?? "Unknown",
            medicalChecked: medicalChecked ?? "Unknown",
            neutered: neutered ?? "Unknown",
            diseases: diseases ?? [],
            money: money ?? -1,
            reason: reason ?? "Unknown",
            advantage: advantage ?? "Unknown",
            disadvantage: disadvantage ?? "Unknown",
            averageCost: averageCost ?? "Unknown",
            adopter: adopter ?? "Unknown",
            status: status ?? "Unknown",
            images: imagesVO,
            isWriter: isWriter ?? false,
            isLike: isLike ?? false,
            isApply: isApply ?? false,
            likeCount: likeCount ?? -1
        )
    }
}
