//
//  LoginAPI.swift
//  Ddungja
//
//  Created by 오승기 on 2023/06/20.
//

import Foundation
import Moya

enum LoginAPI {
    case kakaoLogin(accessToken: String)
}

extension LoginAPI: TargetType, AccessTokenAuthorizable {
    var baseURL: URL {
        return URL(string: "")!
    }
    
    var path: String {
        switch self {
        case .kakaoLogin:
            return ""
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
        case .kakaoLogin(let accessToken):
            return .requestParameters(parameters: ["": accessToken], encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .kakaoLogin:
            return .none
        }
    }
    
    var authorizationType: Moya.AuthorizationType? {
        switch self {
        case .kakaoLogin:
            return .bearer
        }
    }
}
