//
//  UserProfileAPI.swift
//  Ddungja
//
//  Created by 오승기 on 2023/06/28.
//

import Foundation
import Moya

struct UserInfo: Encodable {
    let profileImageId: Int
    let job: String
    let environment: String
    let people: Int
    let comment: String
    let color: String
    let openTalk: String
    let region: String
    let isExperience: Bool
    let experiences: [ExperienceForRequest]
}

struct ExperienceForRequest: Encodable {
    let species: String
    let period: Int
}

enum UserProfileAPI {
    case myPage
    case detail(userId: String)
    case register(userInfo: ProfileEditReqiestDTO)
    case modify(userInfo: ProfileEditReqiestDTO)
    case deleteUserInfo
}

extension UserProfileAPI: TargetType {
    var baseURL: URL {
        return URL(string: NetworkConfiguration.petmilyURL as! String)!
    }
    
    var path: String {
        switch self {
        case .myPage:
            return "users/myPage"
            
        case let .detail(userId):
            return "users/profile/\(userId)"
            
        case .register, .modify:
            return "users/profile"
            
        case .deleteUserInfo:
            return "users"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .myPage, .detail:
            return .get
            
        case .register:
            return .post
            
        case .modify:
            return .put
            
        case .deleteUserInfo:
            return .delete
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .myPage, .detail:
            return .requestPlain
            
        case let .register(userInfo):
            return .requestJSONEncodable(userInfo)
            
        case let .modify(userInfo):
            return .requestJSONEncodable(userInfo)
            
        case .deleteUserInfo:
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
