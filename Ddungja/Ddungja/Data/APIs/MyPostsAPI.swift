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
}

extension MyPostsAPI: TargetType {
    var baseURL: URL {
        return URL(string: "http://awseb-awseb-1melje2xj5uyh-307693018.ap-northeast-2.elb.amazonaws.com")!
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
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .myEditPosts, .myApplyPosts, .applyList, .detailApply:
            return .get
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
        }
    }
    
    var headers: [String : String]? {
        return ["Authorization" : "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJqd3QiLCJpZCI6MSwiZXhwIjoxNjkwNjQ2MjMwfQ.1hGNP1_T0wxTQZcD0nBkYc1vEAqwXRbg3X1S4oa9af1ehlX8l4ivaJpp_Lat6B43RdUafS9b1LHXx5jVyqKp7A"]
    }
}
