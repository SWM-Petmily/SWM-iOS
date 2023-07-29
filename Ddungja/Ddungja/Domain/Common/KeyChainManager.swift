//
//  KeyChainManager.swift
//  Ddungja
//
//  Created by 오승기 on 2023/07/25.
//

import Foundation
//import Security

final class KeyChainManager {
    
    enum Keys: String {
        case accessToken
        case refreshToken
    }

    static func create(key: Keys, token: String) {
        let query: NSDictionary = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrAccount: key.rawValue,
            kSecValueData: token.data(using: .utf8, allowLossyConversion: false) as Any
        ]
        SecItemDelete(query)
        SecItemAdd(query, nil)
    }
    
    static func read(key: Keys) -> String? {
        let query: NSDictionary = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrAccount: key.rawValue,
            kSecReturnData: kCFBooleanTrue as Any,
            kSecMatchLimit: kSecMatchLimitOne
        ]
        
        var dataTypeRef: AnyObject?
        let status = SecItemCopyMatching(query, &dataTypeRef)
        
        if status == errSecSuccess {
            if let retrievedData = dataTypeRef as? Data {
                let value = String(data: retrievedData, encoding: String.Encoding.utf8)
                return value
            }
        }
        return nil
    }
    
    static func delete(key: Keys) {
        let query: NSDictionary = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrAccount: key.rawValue
        ]
        SecItemDelete(query)
    }
}
