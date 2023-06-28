//
//  UserProfileAPIProvider.swift
//  Ddungja
//
//  Created by 오승기 on 2023/06/28.
//

import Foundation
import Moya
import CombineMoya
import Combine

final class UserProfileAPIProvider {
    let moyaProvider: MoyaProvider<UserProfileAPI>
    
    init(moyaProvider: MoyaProvider<UserProfileAPI> = .init()) {
        self.moyaProvider = moyaProvider
    }
    
}
