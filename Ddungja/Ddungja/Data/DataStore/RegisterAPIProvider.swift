//
//  RegisterAPIProvider.swift
//  Ddungja
//
//  Created by 오승기 on 2023/08/05.
//

import Moya
import CombineMoya
import Combine
import UIKit

protocol RegisterDataSourceInterface {
    func getRegisteredPet() -> AnyPublisher<RegisteredPetDTO, MoyaError>
    func registerPost(_ vo: PetPostVO, _ images: [UIImage]) -> AnyPublisher<RegisterPostDTO, MoyaError>
}

final class RegisterAPIProvider: RegisterDataSourceInterface {
    private let moyaProvider: MoyaProvider<RegisterAPI>
    
    init(moyaProvider: MoyaProvider<RegisterAPI> = .init()) {
        self.moyaProvider = moyaProvider
    }
    
    func getRegisteredPet() -> AnyPublisher<RegisteredPetDTO, MoyaError> {
        return moyaProvider.requestPublisher(.getRegiteredPet)
            .retry(3)
            .eraseToAnyPublisher()
            .map(RegisteredPetDTO.self)
    }
    
    func registerPost(_ vo: PetPostVO, _ images: [UIImage]) -> AnyPublisher<RegisterPostDTO, MoyaError> {
        moyaProvider.requestPublisher(.registerPost(vo: vo, images: images))
            .retry(3)
            .eraseToAnyPublisher()
            .map(RegisterPostDTO.self)
    }
}
