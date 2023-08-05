//
//  RegisterUsecaseInterface.swift
//  Ddungja
//
//  Created by 오승기 on 2023/08/05.
//

import Foundation

protocol RegisterUsecaseInterface {
    
}

final class RegisterUsecase: RegisterUsecaseInterface {
    private let repository: RegisterRepositoryInterface
    
    init(repository: RegisterRepositoryInterface) {
        self.repository = repository
    }
}
