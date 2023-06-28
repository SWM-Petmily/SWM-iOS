//
//  UserProfileAPI.swift
//  Ddungja
//
//  Created by 오승기 on 2023/06/28.
//

import Foundation
import Moya

enum UserProfileAPI {
    case detail(userId: String)
    case register(userInfo: UserInfo)
    case modify(userInfo: UserInfo)
}

extension UserProfileAPI: TargetType, AccessTokenAuthorizable {
    var baseURL: URL {
        return URL(string: "")!
    }
    
    var path: String {
        switch self {
        case let .detail(userId):
            return "users/\(userId)"
            
        case .register, .modify:
            return "users"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .detail:
            return .get
            
        case .register:
            return .post
            
        case .modify:
            return .put
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .detail:
            return .requestPlain
            
        case let .register(userInfo):
            do {
                let jsonData = try JSONEncoder().encode(userInfo)
                return .requestJSONEncodable(jsonData)
            } catch {
                return .requestPlain
            }
            
        case let .modify(userInfo):
            do {
                let jsonData = try JSONEncoder().encode(userInfo)
                return .requestJSONEncodable(jsonData)
            } catch {
                return .requestPlain
            }
        }
    }
    
    var headers: [String : String]? {
        return .none
    }
    
    var authorizationType: AuthorizationType? {
        switch self {
        case .detail:
            return .none
            
        case .modify, .register:
            return .bearer
        }
    }

}
