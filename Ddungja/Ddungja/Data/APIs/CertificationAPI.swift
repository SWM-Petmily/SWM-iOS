//
//  CertificationAPI.swift
//  Ddungja
//
//  Created by 오승기 on 2023/08/09.
//

import UIKit
import Moya

enum CertificationAPI {
    case getAdditionalPage(postId: Int)
    case registerUsersPetNumber(dto: RegisterPetNumberDTO)
    case registerPetNumber(postId: Int, dto: RegisterPetNumberDTO)
    case registerHealthInfo(postId: Int, images: [UIImage])
    case registerVaccineInfo(postId: Int, images: [UIImage])
}

extension CertificationAPI: TargetType {
    var baseURL: URL {
        return URL(string: NetworkConfiguration.petmilyURL as! String)!
    }
    
    var path: String {
        switch self {
        case let .getAdditionalPage(postId):
            return "posts/certify/\(postId)"
        case let .registerUsersPetNumber:
            return "users/register"
        case let .registerPetNumber(postId, _):
            return "posts/certifyRegistration/\(postId)"
        case let .registerHealthInfo(postId, _):
            return "posts/certifyMedicalCheck/\(postId)"
        case let .registerVaccineInfo(postId, _):
            return "posts/certifyVaccination/\(postId)"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getAdditionalPage:
            return .get
        case .registerUsersPetNumber, .registerPetNumber, .registerHealthInfo, .registerVaccineInfo:
            return .post
        }
    }
    
    var task: Task {
        switch self {
        case .getAdditionalPage:
            return .requestPlain
        case let .registerUsersPetNumber(dto):
            return .requestJSONEncodable(dto)
        case let .registerPetNumber(_, dto):
            return .requestJSONEncodable(dto)
        case let .registerHealthInfo(_, images):
            var formDataArray: [MultipartFormData] = []
            
            for image in images {
                if let imageData = image.jpegData(compressionQuality: 0.1) {
                    let formData = MultipartFormData(provider: .data(imageData), name: "medicalCheckImages", fileName: "image.jpg", mimeType: "image/jpeg")
                    formDataArray.append(formData)
                }
            }
            return .uploadMultipart(formDataArray)
        case let .registerVaccineInfo(_, images):
            var formDataArray: [MultipartFormData] = []
            
            for image in images {
                if let imageData = image.jpegData(compressionQuality: 0.1) {
                    let formData = MultipartFormData(provider: .data(imageData), name: "vaccinationImages", fileName: "image.jpg", mimeType: "image/jpeg")
                    formDataArray.append(formData)
                }
            }
            return .uploadMultipart(formDataArray)
        }
    }
    
    var headers: [String : String]? {
        if let accessToken = KeyChainManager.read(key: .accessToken) {
            return ["Authorization" : accessToken]
        }
        return .none
    }
}
