//
//  ErrorVO.swift
//  Ddungja
//
//  Created by 오승기 on 2023/08/10.
//

import Foundation

enum ErrorVO: Error {
    
    case retryableError
    case fatalError
    case tokenExpired
    
    var localizedString: String {
        switch self {
        case .retryableError:
            return "일시적인 네트워크 오류입니다.\n다시 시도 해주세요"
        case .fatalError:
            return "치명적 오류입니다. 빠른 시일 내 복구하겠습니다."
        case .tokenExpired:
            return "토큰이 만료되었습니다. 다시 로그인 해주세요."
        }
    }
}