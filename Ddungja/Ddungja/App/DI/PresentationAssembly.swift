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
            return UserProfileViewModel(coordinator: Coordinator.instance, profileUsecase: useCase)
        }
        
        container.register(UserProfileView.self) { resolver in
            let userProfileViewModel = resolver.resolve(UserProfileViewModel.self)!
            return UserProfileView(viewModel: userProfileViewModel)
        }
        
        container.register(EditProfile.self) { resolver in
            let userProfileViemodel = resolver.resolve(UserProfileViewModel.self)!
            return EditProfile(viewModel: userProfileViemodel)
        }
        
        container.register(MyPageVIew.self) { resolver in
            return MyPageVIew(viewModel: MyPageViewModel(coordinator: Coordinator.instance))
        }
    }
}
