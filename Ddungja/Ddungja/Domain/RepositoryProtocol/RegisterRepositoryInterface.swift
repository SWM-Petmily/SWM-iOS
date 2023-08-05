//
//  RegisterRepositoryInterface.swift
//  Ddungja
//
//  Created by 오승기 on 2023/08/05.
//

import Combine
import Moya

protocol RegisterRepositoryInterface {
    func getRegisteredPet() -> AnyPublisher<[RegisteredPetVO], MoyaError>
}
