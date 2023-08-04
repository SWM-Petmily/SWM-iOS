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
            let viewModel = resolver.resolve(ApplyCommonViewModel.self)!
            return MyApplyPostsViewModel(coordinator: coordinator, myPostsUsecase: usecase, applyViewModel: viewModel)
        }
        
        container.register(ApplyCommonViewModel.self) { resolover in
            let usecase = resolover.resolve(MyApplyPostsUsecaseInterface.self)!
            return ApplyCommonViewModel(myPostsUsecase: usecase)
        }
        
        container.register(LoginViewModel.self) { resolver in
            let usecase = resolver.resolve(LoginUsecaseInterface.self)!
            return LoginViewModel(coordinator:coordinator ,loginUsecase: usecase)
        }
        
        container.register(LoginScene.self) { resolver in
            let viewModel = resolver.resolve(LoginViewModel.self)!
            return LoginScene(viewModel: viewModel)
        }
        
        container.register(UserProfileView.self) { resolver in
            let userProfileViewModel = resolver.resolve(UserProfileViewModel.self)!
            return UserProfileView(viewModel: userProfileViewModel)
        }
        
        container.register(EditProfile.self) { resolver in
            let userProfileViemodel = resolver.resolve(UserProfileViewModel.self)!
            return EditProfile(viewModel: userProfileViemodel)
        }
        
        container.register(MyPageScene.self) { resolver in
            return MyPageScene(viewModel: MyPageViewModel(coordinator: coordinator))
        }
        
        container.register(DdungjaTabScene.self) { resolver in
            let home = resolver.resolve(HomeScene.self)!
            let mypage = resolver.resolve(MyPageScene.self)!
            return DdungjaTabScene(home, mypage)
        }
        
        container.register(MyPostsScene.self) { resolver in
            let mypostsViewModel = resolver.resolve(MyPostsViewModel.self)!
            return MyPostsScene(viewModel: mypostsViewModel)
        }
        
        container.register(MyApplyPostsScene.self) { resolver in
            let mypostsViewModel = resolver.resolve(MyApplyPostsViewModel.self)!
            return MyApplyPostsScene(viewModel: mypostsViewModel)
        }
        
        container.register(ApplyModifyVIew.self) { (resolver, id) in
            let mypostsViewModel = resolver.resolve(MyApplyPostsViewModel.self)!
            return ApplyModifyVIew(viewModel: mypostsViewModel, id: id)
        }
        
        container.register(ApplyListScene.self) { (resolver, id: Int) in
            let myPostsViewModel = resolver.resolve(MyPostsViewModel.self)!
            return ApplyListScene(viewModel: myPostsViewModel, id: id)
        }
        
        container.register(DetailApplyView.self) { (resolver, id: Int) in
            let myPostsViewModel = resolver.resolve(MyPostsViewModel.self)!
            return DetailApplyView(viewModel: myPostsViewModel, id: id)
        }
        
        container.register(SignUpViewModel.self) { resolver in
            let usecase = resolver.resolve(SignUpUsecaseInterface.self)!
            return SignUpViewModel(coordinator:coordinator ,signUpUsecase: usecase)
        }
        
        container.register(SignUpScene.self) { resolver in
            let signUpViewModel = resolver.resolve(SignUpViewModel.self)!
            return SignUpScene(viewModel: signUpViewModel)
        }
        
        container.register(HomeViewModel.self) { resolver in
            let usecase = resolver.resolve(HomeUsecaseInterface.self)!
            return HomeViewModel(coordinator: coordinator, homeUsecase: usecase)
        }
        
        container.register(DetailPostViewModel.self) { resolver in
            let usecase = resolver.resolve(HomeUsecaseInterface.self)!
            let viewModel = resolver.resolve(ApplyCommonViewModel.self)!
            return DetailPostViewModel(coordinator: coordinator, homeUsecase: usecase, applyCommon: viewModel)
        }
        
        container.register(HomeScene.self) { resolver in
            let homeViewModel = resolver.resolve(HomeViewModel.self)!
            return HomeScene(viewModel: homeViewModel)
        }
        
        container.register(ApplyCommonView.self) { resolver in
            let viewModel = resolver.resolve(ApplyCommonViewModel.self)!
            return ApplyCommonView(viewModel: viewModel)
        }
        
        container.register(DetailPostScene.self) { (resolver, id: Int) in
            let viewModel = resolver.resolve(DetailPostViewModel.self)!
            return DetailPostScene(viewModel: viewModel, postId: id)
        }
        
        container.register(ApplyAdoptionView.self) { (resolver, id: Int) in
            let viewModel = resolver.resolve(DetailPostViewModel.self)!
            return ApplyAdoptionView(viewModel: viewModel)
        }
    }
}
