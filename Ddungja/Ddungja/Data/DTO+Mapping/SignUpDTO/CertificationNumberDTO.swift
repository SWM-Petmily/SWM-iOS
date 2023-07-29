//
//  CertificationNumberDTO.swift
//  Ddungja
//
//  Created by 오승기 on 2023/06/22.
//

import Foundation

struct CertificationNumberDTO: Decodable {
    let certificationId: Int?
}

extension CertificationNumberDTO {
    func toNumberVO() -> CertificationNumberVO {
        return CertificationNumberVO(certificationId: certificationId ?? -1)
    }
}
