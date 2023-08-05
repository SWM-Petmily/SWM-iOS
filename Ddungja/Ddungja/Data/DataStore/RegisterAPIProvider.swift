//
//  RegisterAPIProvider.swift
//  Ddungja
//
//  Created by 오승기 on 2023/08/05.
//

import Moya
import CombineMoya
import Combine

protocol RegisterDataSourceInterface {
    
}

final class RegisterAPIProvider: RegisterDataSourceInterface {
    private let moyaProvider: MoyaProvider<RegisterAPI>
    
    init(moyaProvider: MoyaProvider<RegisterAPI> = .init()) {
        self.moyaProvider = moyaProvider
    }
}
