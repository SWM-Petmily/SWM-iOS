//
//  ProfileUsecase.swift
//  Ddungja
//
//  Created by 오승기 on 2023/07/06.
//

import Combine
import Moya

protocol ProfileUsecaseInterface {
    func getUserProfile() -> AnyPublisher<ProfileVO, MoyaError>
    func putEditUserProfile(profile: ProfileEditVO)
}

final class ProfileUsecase: ProfileUsecaseInterface {
    
    let repository: ProfileRepository
    
    init(repository: ProfileRepository) {
        self.repository = repository
    }
    
    func getUserProfile() -> AnyPublisher<ProfileVO, MoyaError> {
        return repository.getUserProfile()
    }
    
    func putEditUserProfile(profile: ProfileEditVO)  {
        repository.putEditUserProfile(VO: profile)
    }
}
