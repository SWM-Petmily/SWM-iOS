//
//  MyPostsAPI.swift
//  Ddungja
//
//  Created by 오승기 on 2023/07/15.
//

import Foundation
import Moya


enum MyPostsAPI {
    case myEditPosts(status: String, page: Int)
    case myApplyPosts(status: String, page: Int)
    case applyList(id: Int, _ page: Int)
    case detailApply(id: Int)
    case acceptInfo(id: Int, approval: AcceptInfoDTO)
    case deleteInfo(id: Int)
    case postApply(postId: Int, info: ApplyDTO)
}

extension MyPostsAPI: TargetType {
    var baseURL: URL {
        return URL(string: NetworkConfiguration.petmilyURL as! String)!
    }
    
    var path: String {
        switch self {
        case .myEditPosts:
            return "posts/user"
            
        case .myApplyPosts:
            return "users/apply"
            
        case let .applyList(id, _):
            return "users/apply/\(id)"
            
        case let .detailApply(id):
            return "users/apply/\(id)/detail"
            
        case let .acceptInfo(id, _):
            return "users/apply/\(id)/approval"
            
        case let .deleteInfo(id):
            return "users/apply/\(id)/cancel"
            
        case let .postApply(postId, _):
            return "users/apply/\(postId)"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .myEditPosts, .myApplyPosts, .applyList, .detailApply:
            return .get
            
        case .acceptInfo, .postApply:
            return .post
            
        case .deleteInfo:
            return .delete
        }
    }
    
    var task: Moya.Task {
        switch self {
        case let .myEditPosts(status, page):
            return .requestParameters(parameters: ["status": status, "page": page], encoding: URLEncoding.queryString)
            
        case let .myApplyPosts(status, page):
            return .requestParameters(parameters: ["status": status, "page": page], encoding: URLEncoding.queryString)
            
        case let .applyList(_, page):
            return .requestParameters(parameters: ["page": page], encoding: URLEncoding.queryString)
            
        case let .detailApply(id):
            return .requestParameters(parameters: ["applyId": id], encoding: URLEncoding.queryString)
            
        case let .acceptInfo(_, approval):
            return .requestJSONEncodable(approval)
            
        case .deleteInfo:
            return .requestPlain
            
        case let .postApply(_, info):
            return .requestJSONEncodable(info)
        }
    }
    
    var headers: [String : String]? {
        if let accessToken = KeyChainManager.read(key: .accessToken) {
            return ["Authorization" : accessToken]
        }
        return .none
    }
}
