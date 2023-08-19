//
//  PresentationAssembly.swift
//  Ddungja
//
//  Created by 오승기 on 2023/07/06.
//

import Swinject
import Foundation

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
            let postUsecase = resolover.resolve(MyApplyPostsUsecaseInterface.self)!
            let usecase = resolover.resolve(ProfileUsecaseInterface.self)!
            return ApplyCommonViewModel(coordinator: coordinator, myPostsUsecase: postUsecase, profileUsecase: usecase)
        }
        
        container.register(LoginViewModel.self) { resolver in
            let usecase = resolver.resolve(LoginUsecaseInterface.self)!
            return LoginViewModel(coordinator:coordinator ,loginUsecase: usecase)
        }
        
        container.register(RegisterViewModel.self) { resolver in
            let usecase = resolver.resolve(RegisterUsecaseInterface.self)!
            return RegisterViewModel(container: container,coordinator: coordinator, registerUsecase: usecase)
        }
        .inObjectScope(.exitSalePost)
        
        container.register(PetCertificationViewModel.self) { resolver in
            let usecase = resolver.resolve(PetCertificationUsecaseInterface.self)!
            return PetCertificationViewModel(coordinator: coordinator, petCertificationUsecase: usecase)
        }
        
        container.register(MyPageViewModel.self) { resolver in
            let usecase = resolver.resolve(ProfileUsecaseInterface.self)!
            return MyPageViewModel(coordinator: coordinator, profileUsecase: usecase)
        }
        
        container.register(LoginScene.self) { resolver in
            let viewModel = resolver.resolve(LoginViewModel.self)!
            return LoginScene(viewModel: viewModel)
        }
        
        container.register(UserProfileView.self) { resolver in
            let userProfileViewModel = resolver.resolve(UserProfileViewModel.self)!
            return UserProfileView(viewModel: userProfileViewModel)
        }
        
        container.register(EditProfile.self) { (resolver, isRegister: Bool) in
            let userProfileViemodel = resolver.resolve(UserProfileViewModel.self)!
            return EditProfile(viewModel: userProfileViemodel, isRegister: isRegister)
        }
        
        container.register(MyPageScene.self) { resolver in
            let viewModel = resolver.resolve(MyPageViewModel.self)!
            return MyPageScene(viewModel: viewModel)
        }
        
        container.register(DdungjaTabScene.self) { resolver in
            let home = resolver.resolve(HomeScene.self)!
            let register = resolver.resolve(RegisterScene.self)!
            let mypage = resolver.resolve(MyPageScene.self)!
            return DdungjaTabScene(home, register, mypage)
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
            return DetailPostViewModel(coordinator: coordinator, homeUsecase: usecase)
        }
        
        container.register(LikeListViewModel.self) { resolver in
            let usecase = resolver.resolve(LikeListUsecaseInterface.self)!
            return LikeListViewModel(coordinator: coordinator, likeListUsecase: usecase)
        }
        
        container.register(HomeScene.self) { resolver in
            let homeViewModel = resolver.resolve(HomeViewModel.self)!
            return HomeScene(viewModel: homeViewModel)
        }
        
        container.register(ApplyCommonView.self) { (resolver, id: Int) in
            let viewModel = resolver.resolve(ApplyCommonViewModel.self)!
            return ApplyCommonView(viewModel: viewModel, postId: id)
        }
        
        container.register(DetailPostScene.self) { (resolver, id: Int) in
            let viewModel = resolver.resolve(DetailPostViewModel.self)!
            return DetailPostScene(viewModel: viewModel, postId: id)
        }
        
        container.register(ApplyAdoptionView.self) { (resolver, id: Int) in
            let viewModel = resolver.resolve(ApplyCommonViewModel.self)!
            return ApplyAdoptionView(viewModel: viewModel, postId: id)
        }
        
        container.register(RegisterScene.self) { resolver in
            let viewModel = resolver.resolve(RegisterViewModel.self)!
            return RegisterScene(viewModel: viewModel)
        }
        
        container.register(PetInfoView.self) { (resolver, info: RegisteredPetVO) in
            let viewModel = resolver.resolve(RegisterViewModel.self)!
            return PetInfoView(viewModel: viewModel, info: info)
        }
        
        container.register(AdoptionReasonView.self) { resolver in
            let viewModel = resolver.resolve(RegisterViewModel.self)!
            return AdoptionReasonView(viewModel: viewModel)
        }
        
        container.register(PetAdvantageView.self) { resolver in
            let viewModel = resolver.resolve(RegisterViewModel.self)!
            return PetAdvantageView(viewModel: viewModel)
        }
        
        container.register(PetDisadvantageView.self) { resolver in
            let viewModel = resolver.resolve(RegisterViewModel.self)!
            return PetDisadvantageView(viewModel: viewModel)
        }
        
        container.register(PetCostView.self) { resolver in
            let viewModel = resolver.resolve(RegisterViewModel.self)!
            return PetCostView(viewModel: viewModel)
        }
        
        container.register(PetAdopterView.self) { resolver in
            let viewModel = resolver.resolve(RegisterViewModel.self)!
            return PetAdopterView(viewModel: viewModel)
        }
        
        container.register(PetCertificationScene.self) { (resolver, postId: Int) in
            let viewModel = resolver.resolve(PetCertificationViewModel.self)!
            return PetCertificationScene(viewModel: viewModel, postId: postId)
        }
        
        container.register(PetRegistrationView.self) { (resolver, postId: Int?) in
            let viewModel = resolver.resolve(PetCertificationViewModel.self)!
            return PetRegistrationView(viewModel: viewModel, postId: postId)
        }
        
        container.register(HealthScreeningView.self) { (resolver, postId: Int) in
            let viewModel = resolver.resolve(PetCertificationViewModel.self)!
            return HealthScreeningView(viewModel: viewModel, postId: postId)
        }
        
        container.register(VaccinationView.self) { (resolver, postId: Int) in
            let viewModel = resolver.resolve(PetCertificationViewModel.self)!
            return VaccinationView(viewModel: viewModel, postId: postId)
        }
        
        container.register(LikeListScene.self) { resolver in
            let viewModel = resolver.resolve(LikeListViewModel.self)!
            return LikeListScene(viewModel: viewModel)
        }
    }
}
