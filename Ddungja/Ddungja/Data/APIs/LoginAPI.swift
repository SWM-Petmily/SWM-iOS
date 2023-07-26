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
}

extension LoginAPI: TargetType {
    var baseURL: URL {
        return URL(string: "https://www.petmily.site")!
    }
    
    var path: String {
        switch self {
        case .kakaoLogin:
            return "users/kakao"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .kakaoLogin:
            return .post
        }
    }
    
    var task: Moya.Task {
        switch self {
        case let .kakaoLogin(vo):
            return .requestParameters(parameters: ["accessToken": vo.accessToken, "tokenType": vo.tokenType], encoding: JSONEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .kakaoLogin:
            return .none
        }
    }
}
