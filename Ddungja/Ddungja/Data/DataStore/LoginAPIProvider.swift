//
//  LoginAPIProvider.swift
//  Ddungja
//
//  Created by 오승기 on 2023/06/21.
//

import Foundation
import Moya
import CombineMoya
import Combine


final class LoginAPIProvider {
    let moyaProvider: MoyaProvider<LoginAPI>
    
    init(moyaProvider: MoyaProvider<LoginAPI> = .init()) {
        self.moyaProvider = moyaProvider
    }
    
    func getLogin() -> AnyPublisher<LoginDTO, MoyaError> {
        return moyaProvider.requestPublisher(.kakaoLogin(accessToken: "accessToken"))
            .map(LoginDTO.self)
    }
}
