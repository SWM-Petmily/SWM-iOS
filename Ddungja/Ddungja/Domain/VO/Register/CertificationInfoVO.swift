//
//  CertificationInfoVO.swift
//  Ddungja
//
//  Created by 오승기 on 2023/08/09.
//

import Foundation

struct CertificationInfoVO: Decodable {
    let postId: Int
    let isRegistered: String
    let isVaccinated: String
    let isMedicalChecked: String
}
