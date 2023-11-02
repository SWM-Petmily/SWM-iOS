//
//  LoginAPI.swift
//  Ddungja
//
//  Created by 오승기 on 2023/06/20.
//

import Foundation
import Moya

enum LoginAPI {
    case kakaoLogin(vo: OAuth.KakaoVO)
    case appleLogin(vo: OAuth.AppleVO)
    case saveToken(token: String)
}

extension LoginAPI: TargetType {
    var baseURL: URL {
        return URL(string: NetworkConfiguration.petmilyURL as! String)!
    }
    
    var path: String {
        switch self {
        case .kakaoLogin:
            return "users/kakao"
            
        case .appleLogin:
            return "users/apple"
            
        case .saveToken:
            return "users/fcm"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .kakaoLogin, .appleLogin, .saveToken:
            return .post
        }
    }
    
    var task: Moya.Task {
        switch self {
        case let .kakaoLogin(vo):
            return .requestParameters(parameters: ["accessToken": vo.accessToken, "tokenType": vo.tokenType], encoding: JSONEncoding.default)
        case let .appleLogin(vo):
            return .requestParameters(parameters: ["accessToken": vo.accessToken, "idToken": vo.idToken], encoding: JSONEncoding.default)
        case let .saveToken(token):
            return .requestParameters(parameters: ["fcmToken": token], encoding: JSONEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .kakaoLogin, .appleLogin:
            return .none
        case .saveToken:
            let accessToken = KeyChainManager.read(key: .accessToken) ?? ""
            return ["Authorization" : accessToken]
        }
    }
}
