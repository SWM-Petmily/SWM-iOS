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
        
        container.register(MyPostsViewModel.self) { resolver in
            let usecase = resolver.resolve(MyPostsUsecaseInterface.self)!
            return MyPostsViewModel(coordinator: Coordinator.instance, myPostsUsecase: usecase)
        }
        
        container.register(MyApplyPostsViewModel.self) { resolver in
            let usecase = resolver.resolve(MyApplyPostsUsecaseInterface.self)!
            return MyApplyPostsViewModel(coordinator: Coordinator.instance, myPostsUsecase: usecase)
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
        
        container.register(MyPostsView.self) { resolver in
            let mypostsViewModel = resolver.resolve(MyPostsViewModel.self)!
            return MyPostsView(viewModel: mypostsViewModel)
        }
        
        container.register(MyApplyPostsView.self) { resolver in
            let mypostsViewModel = resolver.resolve(MyApplyPostsViewModel.self)!
            return MyApplyPostsView(viewModel: mypostsViewModel)
        }
        
        container.register(ApplyListView.self) { (resolver, id: Int) in
            let myPostsViewModel = resolver.resolve(MyPostsViewModel.self)!
            return ApplyListView(viewModel: myPostsViewModel, id: id)
        }
    }
}
