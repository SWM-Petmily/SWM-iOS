//
//  PresentationAssembly.swift
//  Ddungja
//
//  Created by 오승기 on 2023/07/06.
//

import Swinject

struct PresentationAssembly: Assembly {
    let coordinator: Coordinator
    func assemble(container: Container) {
        container.register(UserProfileViewModel.self) { resolver in
            let useCase = resolver.resolve(ProfileUsecaseInterface.self)!
            return UserProfileViewModel(coordinator: coordinator, profileUsecase: useCase)
        }
        
        container.register(MyPostsViewModel.self) { resolver in
            let usecase = resolver.resolve(MyPostsUsecaseInterface.self)!
            return MyPostsViewModel(coordinator: coordinator, myPostsUsecase: usecase)
        }
        
        container.register(MyApplyPostsViewModel.self) { resolver in
            let usecase = resolver.resolve(MyApplyPostsUsecaseInterface.self)!
            return MyApplyPostsViewModel(coordinator: coordinator, myPostsUsecase: usecase)
        }
        
        container.register(LoginViewModel.self) { resolver in
            let usecase = resolver.resolve(LoginUsecaseInterface.self)!
            return LoginViewModel(coordinator:coordinator ,loginUsecase: usecase)
        }
        
        container.register(LoginView.self) { resolver in
            let viewModel = resolver.resolve(LoginViewModel.self)!
            return LoginView(viewModel: viewModel)
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
            return MyPageVIew(viewModel: MyPageViewModel(coordinator: coordinator))
        }
        
        container.register(DdungjaTabView.self) { resolver in
            let mypage = resolver.resolve(MyPageVIew.self)!
            return DdungjaTabView(mypage)
        }
        
        container.register(MyPostsView.self) { resolver in
            let mypostsViewModel = resolver.resolve(MyPostsViewModel.self)!
            return MyPostsView(viewModel: mypostsViewModel)
        }
        
        container.register(MyApplyPostsView.self) { resolver in
            let mypostsViewModel = resolver.resolve(MyApplyPostsViewModel.self)!
            return MyApplyPostsView(viewModel: mypostsViewModel)
        }
        
        container.register(ApplyModifyVIew.self) { (resolver, id) in
            let mypostsViewModel = resolver.resolve(MyApplyPostsViewModel.self)!
            return ApplyModifyVIew(viewModel: mypostsViewModel, id: id)
        }
        
        container.register(ApplyListView.self) { (resolver, id: Int) in
            let myPostsViewModel = resolver.resolve(MyPostsViewModel.self)!
            return ApplyListView(viewModel: myPostsViewModel, id: id)
        }
        
        container.register(DetailApplyView.self) { (resolver, id: Int) in
            let myPostsViewModel = resolver.resolve(MyPostsViewModel.self)!
            return DetailApplyView(viewModel: myPostsViewModel, id: id)
        }
        
        container.register(SignUpViewModel.self) { resolver in
            let usecase = resolver.resolve(SignUpUsecaseInterface.self)!
            return SignUpViewModel(coordinator:coordinator ,signUpUsecase: usecase)
        }
        
        container.register(SignUpView.self) { resolver in
            let signUpViewModel = resolver.resolve(SignUpViewModel.self)!
            return SignUpView(viewModel: signUpViewModel)
        }
    }
}
