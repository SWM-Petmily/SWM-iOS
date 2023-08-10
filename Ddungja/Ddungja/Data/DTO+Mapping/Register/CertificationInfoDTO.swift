//
//  CertificationInfoDTO.swift
//  Ddungja
//
//  Created by 오승기 on 2023/08/09.
//

import Foundation

struct CertificationInfoDTO: Decodable {
    let postId: Int?
    let isRegistered: String?
    let isVaccinated: String?
    let isMedicalChecked: String?
}

extension CertificationInfoDTO {
    func toCertificationInfoVO() -> CertificationInfoVO {
        return CertificationInfoVO(postId: postId ?? -1,
                                   isRegistered: isRegistered ?? "NONE",
                                   isVaccinated: isVaccinated ?? "NONE",
                                   isMedicalChecked: isMedicalChecked ?? "NONE")
    }
}
