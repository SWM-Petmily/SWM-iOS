//
//  MoyaError.swift
//  Ddungja
//
//  Created by 오승기 on 2023/08/10.
//

import Moya

extension MoyaError {
    
    func toNetworkError() -> NetworkErrorDTO {
        switch self {
        case let .imageMapping(response):
            return .mappingError(response)
        case let .jsonMapping(response):
            return .mappingError(response)
        case let .stringMapping(response):
            return .mappingError(response)
        case let .objectMapping(_, response):
            return .mappingError(response)
        case let .statusCode(response):
            return .mappingError(response)
        case let .encodableMapping(error):
            return .encodableError(error)
        case let .requestMapping(string):
            return .requestError(string)
        case let .parameterEncoding(error):
            return .encodableError(error)
        case let .underlying(error, response):
            if response?.statusCode == 401, let httpUrlResponse = response?.response {
                if httpUrlResponse.url?.lastPathComponent == "reissue" {
                    return NetworkErrorDTO.tokenExpired
                }
            }
            
            if let afError = error.asAFError, afError.isRequestRetryError {
                if case .requestRetryFailed = afError {
                    if response?.statusCode == 401 {
                        return NetworkErrorDTO.tokenExpired
                    }
                }
            }
            return .underlyingError(error, response)
        }
    }
    
}
