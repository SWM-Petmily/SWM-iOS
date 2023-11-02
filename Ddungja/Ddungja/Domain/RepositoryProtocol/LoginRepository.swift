//
//  LoginRepository.swift
//  Ddungja
//
//  Created by 오승기 on 2023/06/23.
//

import Combine

protocol LoginRepository {
    func requestKakaoLogin() -> AnyPublisher<OAuth.KakaoVO, Error>
    func requestAppleLogin() -> AnyPublisher<OAuth.AppleVO, Error>
    func postLogin(_ oauth: OAuth) -> AnyPublisher<LoginVO, CustomErrorVO>
    func saveFCMToken(_ token: String) -> AnyPublisher<Void, CustomErrorVO>
}
