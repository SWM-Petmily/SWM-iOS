//
//  CustomErrorVO.swift
//  Ddungja
//
//  Created by 오승기 on 2023/08/11.
//

import Foundation

struct CustomErrorVO: Error, Decodable {
    let code: Int
    let status: String
    let message: String
}
