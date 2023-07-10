//
//  DomainAssembly.swift
//  Ddungja
//
//  Created by 오승기 on 2023/07/06.
//

import Swinject

struct DomainAssembly: Assembly {
    
    func assemble(container: Container) {
        container.register(ProfileUsecaseInterface.self) { resolver in
            let repository = resolver.resolve(ProfileRepository.self)!
            return ProfileUsecase(repository: repository)
        }
    }
}
