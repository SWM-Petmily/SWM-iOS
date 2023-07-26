//
//  OAuthDTO.swift
//  Ddungja
//
//  Created by 오승기 on 2023/07/26.
//

import Foundation

enum OAuth {
    case kakao(KakaoVO)
    
    struct KakaoVO {
        let accessToken: String
        let tokenType: String
        
        init(accessToken: String, tokenType: String) {
            self.accessToken = accessToken
            self.tokenType = tokenType
        }
    }
}
