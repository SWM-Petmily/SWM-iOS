//
//  NetworkConfiguration.swift
//  Ddungja
//
//  Created by 오승기 on 2023/08/10.
//

import Foundation

enum NetworkConfiguration {
    static let petmilyURL = Bundle.main.infoDictionary?["SERVER_URL"] ?? ""
    static var accessToken: String {
        KeyChainManager.read(key: .accessToken) ?? ""
    }
    static var refreshToken: String {
        KeyChainManager.read(key: .refreshToken) ?? ""
    }
}
