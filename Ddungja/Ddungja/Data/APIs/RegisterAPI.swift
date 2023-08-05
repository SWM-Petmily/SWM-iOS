//
//  RegisterAPI.swift
//  Ddungja
//
//  Created by 오승기 on 2023/08/05.
//

import Foundation
import Moya

enum RegisterAPI {
    case getRegiteredPet
}

extension RegisterAPI: TargetType {
    var baseURL: URL {
        return URL(string: "https://www.petmily.site")!
    }
    
    var path: String {
        switch self {
        case .getRegiteredPet:
            return "users/register/myRegister"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getRegiteredPet:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .getRegiteredPet:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        return ["Authorization" : "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJqd3QiLCJpZCI6MSwiZXhwIjoxNjkxOTk4NjAzfQ._k8PvIWKG_9PtY_KIa60DHOjKtOS17W2oCW-yNRKq77IIiw8TVR9MDCE3lQO0q40wrygK0mQOodpUPwDaUjvHA"]
    }
}
