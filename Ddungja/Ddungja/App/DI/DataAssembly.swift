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
        
        container.register(MyPostsDataSourceInterface.self) { _ in
            return MyPostsAPIProvider()
        }
        
        container.register(LoginDataSourceInterface.self) { _ in
            return LoginAPIProvider()
        }
        
        container.register(OAuthProviderInterface.self) { _ in
            return OAuthProvider()
        }
        
        container.register(ProfileRepository.self) { resolver in
            let dataSource = resolver.resolve(UserProfileDataSourceInterface.self)!
            return ProfileToVORepository(dataSource: dataSource)
        }
        
        container.register(MyPostsRepositoryInterface.self) { resolver in
            let myPostsDataSourceInterface = resolver.resolve(MyPostsDataSourceInterface.self)!
            return MyPostsRepository(dataSource: myPostsDataSourceInterface)
        }
        
        container.register(LoginRepository.self) { resolver in
            let loginDatasource = resolver.resolve(LoginDataSourceInterface.self)!
            let oauthDataSource = resolver.resolve(OAuthProviderInterface.self)!
            return LoginToVORepository(loginDataSource: loginDatasource, oauthDataSource: oauthDataSource)
        }
    }
}
