//
//  HomeAPI.swift
//  Ddungja
//
//  Created by 오승기 on 2023/08/01.
//

import Foundation
import Moya

enum HomeAPI {
    case mainPost(page: Int)
    case like(id: Int)
    case disLike(id: Int)
    case detailPost(id: Int)
}

extension HomeAPI: TargetType {
    var baseURL: URL {
        return URL(string: NetworkConfiguration.petmilyURL as! String)!
    }
    
    var path: String {
        switch self {
        case .mainPost:
            return "posts/main"
        case let .like(id), let .disLike(id):
            return "posts/like/\(id)"
        case let .detailPost(id):
            return "posts/\(id)"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .mainPost, .detailPost:
            return .get
        case .like:
            return .post
        case .disLike:
            return .delete
        }
    }
    
    var task: Task {
        switch self {
        case let .mainPost(page):
            return .requestParameters(parameters: ["page": page], encoding: URLEncoding.queryString)
        case .like, .disLike, .detailPost:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        if let accessToken = KeyChainManager.read(key: .accessToken) {
            return ["Authorization" : accessToken]
        }
        return .none
    }
}

