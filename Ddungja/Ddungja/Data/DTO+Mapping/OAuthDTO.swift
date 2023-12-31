//
//  OAuthDTO.swift
//  Ddungja
//
//  Created by 오승기 on 2023/07/26.
//

import Foundation

enum OAuth {
    case kakao(KakaoVO)
    case apple(AppleVO)
    
    struct KakaoVO {
        let accessToken: String
        let tokenType: String
        
        init(accessToken: String, tokenType: String) {
            self.accessToken = accessToken
            self.tokenType = tokenType
        }
    }
    
    struct AppleVO {
        let accessToken: String
        let idToken: String

        init(accessToken: String, idToken: String) {
            self.accessToken = accessToken
            self.idToken = idToken
        }
    }
}
