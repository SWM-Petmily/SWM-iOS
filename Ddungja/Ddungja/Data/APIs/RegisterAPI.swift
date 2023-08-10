//
//  RegisterAPI.swift
//  Ddungja
//
//  Created by 오승기 on 2023/08/05.
//

import Foundation
import Moya
import UIKit

enum RegisterAPI {
    case getRegiteredPet
    case registerPost(vo: PetPostVO, images: [UIImage])
}

extension RegisterAPI: TargetType {
    var baseURL: URL {
        return URL(string: NetworkConfiguration.petmilyURL as! String)!
    }
    
    var path: String {
        switch self {
        case .getRegiteredPet:
            return "users/register/myRegister"
        case .registerPost:
            return "posts"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getRegiteredPet:
            return .get
        case .registerPost:
            return .post
        }
    }
    
    var task: Task {
        switch self {
        case .getRegiteredPet:
            return .requestPlain
        case let .registerPost(vo, images):
            var formDataArray: [MultipartFormData] = []
            
            // Append images to formDataArray
            for image in images {
                if let imageData = image.jpegData(compressionQuality: 0.1) {
                    let formData = MultipartFormData(provider: .data(imageData), name: "postImage", fileName: "image.jpg", mimeType: "image/jpeg")
                    formDataArray.append(formData)
                }
            }
            
            let jsonEncoder = JSONEncoder()
            if let voData = try? jsonEncoder.encode(vo) {
                let voFormData = MultipartFormData(provider: .data(voData), name: "postRequest")
                formDataArray.append(voFormData)
            }
            print(formDataArray)
            return .uploadMultipart(formDataArray)
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .getRegiteredPet:
            return ["Authorization" : "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJqd3QiLCJpZCI6MSwiZXhwIjoxNjkxOTk4NjAzfQ._k8PvIWKG_9PtY_KIa60DHOjKtOS17W2oCW-yNRKq77IIiw8TVR9MDCE3lQO0q40wrygK0mQOodpUPwDaUjvHA"]
        case .registerPost:
            return ["Authorization" : "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJqd3QiLCJpZCI6MSwiZXhwIjoxNjkxOTk4NjAzfQ._k8PvIWKG_9PtY_KIa60DHOjKtOS17W2oCW-yNRKq77IIiw8TVR9MDCE3lQO0q40wrygK0mQOodpUPwDaUjvHA","Content-type" : "multipart/form-data"]
        }
    }
}
