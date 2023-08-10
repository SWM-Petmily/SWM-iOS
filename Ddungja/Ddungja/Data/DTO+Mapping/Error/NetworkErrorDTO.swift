//
//  NetworkErrorDTO.swift
//  Ddungja
//
//  Created by 오승기 on 2023/08/10.
//

import Moya

enum NetworkErrorDTO: Error {
    case requestError(String)
    case encodableError(Error)
    case mappingError(Response)
    case underlyingError(Error, Response?)
    case tokenExpired
    
    func toVO() -> ErrorVO {
        switch self {
        case .requestError:
            return .fatalError
        case .encodableError:
            return .fatalError
        case .mappingError:
            return .retryableError
        case .underlyingError:
            return .fatalError
        case .tokenExpired:
            return .tokenExpired
        }
    }
}
