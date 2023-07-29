//
//  SignUpAPI.swift
//  Ddungja
//
//  Created by 오승기 on 2023/06/22.
//

import Foundation
import Moya

enum SignUpAPI {
    case requestCertificationNumber(phoneNumber: ReqeustCertificationDTO)
    case checkCertificationNumber(phoneNumber: String, certificationNumber: String)
    case userInfo
}

extension SignUpAPI: TargetType {
    var baseURL: URL {
        return URL(string: "https://www.petmily.site")!
    }
    
    var path: String {
        switch self {
        case .requestCertificationNumber:
            return "users/certification/send"
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
        case let .requestCertificationNumber(phoneNumber):
            return .requestJSONEncodable(phoneNumber)
            
        case .checkCertificationNumber:
            return .requestParameters(parameters: ["": ""], encoding: URLEncoding.queryString)
            
        case .userInfo:
            return .requestParameters(parameters: ["": ""], encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .requestCertificationNumber, .checkCertificationNumber, .userInfo:
            return ["Authorization" : "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJqd3QiLCJpZCI6MSwiZXhwIjoxNjkwNjQ2MjMwfQ.1hGNP1_T0wxTQZcD0nBkYc1vEAqwXRbg3X1S4oa9af1ehlX8l4ivaJpp_Lat6B43RdUafS9b1LHXx5jVyqKp7A"]
        }
    }
}
