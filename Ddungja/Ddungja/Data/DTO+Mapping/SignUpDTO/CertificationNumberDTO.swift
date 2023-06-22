//
//  CertificationNumberDTO.swift
//  Ddungja
//
//  Created by 오승기 on 2023/06/22.
//

import Foundation

struct CertificationNumberDTO: Decodable {
    let requestId: String
    let requestTime: String
    let statusCode: Int
    let statusName: String
}
