//
//  DataAssembly.swift
//  Ddungja
//
//  Created by 오승기 on 2023/07/06.
//

import Swinject

struct DataAssembly: Assembly {
    
    func assemble(container: Container) {
        container.register(UserProfileDataSourceInterface.self) { _ in
            return UserProfileAPIProvider()
        }
        
        container.register(ProfileRepository.self) { resolver in
            let dataSource = resolver.resolve(UserProfileDataSourceInterface.self)!
            return ProfileToVORepository(dataSource: dataSource)
        }
    }
}