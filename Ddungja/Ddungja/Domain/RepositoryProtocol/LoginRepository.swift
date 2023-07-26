//
//  LoginRepository.swift
//  Ddungja
//
//  Created by 오승기 on 2023/06/23.
//

import Combine
import Moya

protocol LoginRepository {
    func requestKakaoLogin() -> AnyPublisher<OAuth.KakaoVO, Error>
    func postLogin(_ oauth: OAuth)  -> AnyPublisher<LoginVO, MoyaError>
}
