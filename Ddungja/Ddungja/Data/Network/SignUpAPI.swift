//
//  SignUpAPI.swift
//  Ddungja
//
//  Created by 오승기 on 2023/06/22.
//

import Foundation
import Moya

enum SignUpAPI {
    case requestCertificationNumber(phoneNumber: String)
    case checkCertificationNumber(phoneNumber: String, certificationNumber: String)
    case userInfo
}

extension SignUpAPI: TargetType {
    var baseURL: URL {
        return URL(string: "")!
    }
    
    var path: String {
        switch self {
        case .requestCertificationNumber:
            return ""
            
        case .checkCertificationNumber:
            return ""
            
        case .userInfo:
            return ""
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .requestCertificationNumber, .checkCertificationNumber, .userInfo:
            return .post
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .requestCertificationNumber:
            return .requestParameters(parameters: ["": ""], encoding: URLEncoding.queryString)
            
        case .checkCertificationNumber:
            return .requestParameters(parameters: ["": ""], encoding: URLEncoding.queryString)
            
        case .userInfo:
            return .requestParameters(parameters: ["": ""], encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .requestCertificationNumber, .checkCertificationNumber, .userInfo:
            return .none
        }
    }
}
