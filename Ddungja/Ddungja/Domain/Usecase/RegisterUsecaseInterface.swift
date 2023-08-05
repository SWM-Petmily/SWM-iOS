//
//  RegisterUsecaseInterface.swift
//  Ddungja
//
//  Created by 오승기 on 2023/08/05.
//

import Combine
import Moya

protocol RegisterUsecaseInterface {
    func getRegisteredPet() -> AnyPublisher<[RegisteredPetVO], MoyaError>
}

final class RegisterUsecase: RegisterUsecaseInterface {
    private let repository: RegisterRepositoryInterface
    
    init(repository: RegisterRepositoryInterface) {
        self.repository = repository
    }
    
    func getRegisteredPet() -> AnyPublisher<[RegisteredPetVO], MoyaError> {
        return repository.getRegisteredPet()
    }
}
