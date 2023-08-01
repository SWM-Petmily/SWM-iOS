//
//  HomeAPI.swift
//  Ddungja
//
//  Created by 오승기 on 2023/08/01.
//

import Foundation
import Moya

enum HomeAPI {
    case mainPost
}

extension HomeAPI: TargetType {
    var baseURL: URL {
        return URL(string: "https://www.petmily.site")!
    }
    
    var path: String {
        switch self {
        case .mainPost:
            return "posts/main"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .mainPost:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .mainPost:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        return ["Authorization" : "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJqd3QiLCJpZCI6MSwiZXhwIjoxNjkxOTk4NjAzfQ._k8PvIWKG_9PtY_KIa60DHOjKtOS17W2oCW-yNRKq77IIiw8TVR9MDCE3lQO0q40wrygK0mQOodpUPwDaUjvHA"]
    }
}

