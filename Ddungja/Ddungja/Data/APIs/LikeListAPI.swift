//
//  LikeListAPI.swift
//  Ddungja
//
//  Created by 오승기 on 2023/08/18.
//

import Moya
import Foundation

enum LikeListAPI {
    case getLikeList(status: String, page: Int)
}

extension LikeListAPI: TargetType {
    var baseURL: URL {
        return URL(string: NetworkConfiguration.petmilyURL as! String)!
    }
    
    var path: String {
        switch self {
        case .getLikeList:
            return "posts/like"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getLikeList:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case let .getLikeList(status, page):
            return .requestParameters(parameters: ["status": status, "page": page], encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String : String]? {
        if let accessToken = KeyChainManager.read(key: .accessToken) {
            return ["Authorization" : accessToken]
        }
        return .none
    }
}

