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
        
        container.register(MyPostsUsecaseInterface.self) { resolver in
            let myPostsRepository = resolver.resolve(MyPostsRepositoryInterface.self)!
            return MyPostsUsecase(repository: myPostsRepository)
        }
        
        container.register(MyApplyPostsUsecaseInterface.self) { resolver in
            let myPostsRepository = resolver.resolve(MyPostsRepositoryInterface.self)!
            return MyApplyPostsUsecase(repository: myPostsRepository)
        }
        
        container.register(LoginUsecaseInterface.self) { resolver in
            let repository = resolver.resolve(LoginRepository.self)!
            return LoginUsecase(repository: repository)
        }
        
        container.register(SignUpUsecaseInterface.self) { resolver in
            let repository = resolver.resolve(SignUpRepository.self)!
            return SignUpUsecase(repository: repository)
        }
        
        container.register(HomeUsecaseInterface.self) { resolver in
            let repository = resolver.resolve(HomeRepository.self)!
            return HomeUsecase(repository: repository)
        }
        
        container.register(RegisterUsecaseInterface.self) { resolver in
            let repository = resolver.resolve(RegisterRepository.self)!
            return RegisterUsecase(repository: repository)
        }
        
        container.register(PetCertificationUsecaseInterface.self) { resolver in
            let repository = resolver.resolve(PetCertificationRepositoryInterface.self)!
            return PetCertificationUsecase(repository: repository)
        }
        
        container.register(LikeListUsecaseInterface.self) { resolver in
            let repository = resolver.resolve(LikeListRepositoryInterface.self)!
            return LikeListUsecase(repository: repository)
        }
    }
}
