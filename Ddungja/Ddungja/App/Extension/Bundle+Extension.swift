//
//  Bundle+Extension.swift
//  Ddungja
//
//  Created by 오승기 on 2023/07/25.
//

import Foundation

extension Bundle {
    var apiKey: String {
        guard let file = path(forResource: "Info", ofType: "plist") else { return "" }
        guard let resource = NSDictionary(contentsOfFile: file) else { return "" }
        guard let key = resource["KAKAO_API_LOGIN_KEY"] as? String else {
            fatalError("API_Key 설정이 안되어 있음.")
        }
        return key
    }
    
    var petmilyURL: String {
        guard let file = path(forResource: "Info", ofType: "plist") else { return "" }
        guard let resource = NSDictionary(contentsOfFile: file) else { return "" }
        guard let key = resource["SERVER_URL"] as? String else {
            fatalError("API_Key 설정이 안되어 있음.")
        }
        return key
    }
}
