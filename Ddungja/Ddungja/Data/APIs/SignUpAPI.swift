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
    case checkCertificationNumber(info: CertificationRequestVO)
    case userInfo(user: RegisterVO)
}

extension SignUpAPI: TargetType {
    var baseURL: URL {
        return URL(string: NetworkConfiguration.petmilyURL as! String)!
    }
    
    var path: String {
        switch self {
        case .requestCertificationNumber:
            return "users/certification/send/test"
        case .checkCertificationNumber:
            return "users/certification/verify"
        case .userInfo:
            return "users/sign"
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
            
        case let .checkCertificationNumber(info):
            return .requestJSONEncodable(info)
            
        case let .userInfo(user):
            return .requestJSONEncodable(user)
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .requestCertificationNumber, .checkCertificationNumber, .userInfo:
            if let accessToken = KeyChainManager.read(key: .accessToken) {
                return ["Authorization" : accessToken]
            }
            return .none
        }
    }
}
