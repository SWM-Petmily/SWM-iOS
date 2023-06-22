//
//  ConfirmNumberDTO.swift
//  Ddungja
//
//  Created by 오승기 on 2023/06/22.
//

import Foundation

struct ConfirmNumberDTO: Decodable {
    let isDuplicate: Bool
    let email: String?
    let socialType: String?
}
