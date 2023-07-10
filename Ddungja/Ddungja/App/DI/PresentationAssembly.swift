//
//  PresentationAssembly.swift
//  Ddungja
//
//  Created by 오승기 on 2023/07/06.
//

import Swinject

struct PresentationAssembly: Assembly {
    
    func assemble(container: Container) {
        container.register(UserProfileViewModel.self) { resolver in
            let useCase = resolver.resolve(ProfileUsecaseInterface.self)!
            return UserProfileViewModel(profileUsecase: useCase)
        }
        
        container.register(UserProfileView.self) { resolver in
            let homeViewModel = resolver.resolve(UserProfileViewModel.self)!
            return UserProfileView(viewModel: homeViewModel)
        }
    }
}
