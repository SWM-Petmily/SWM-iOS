//
//  ProfileUsecase.swift
//  Ddungja
//
//  Created by 오승기 on 2023/07/06.
//

import Combine

protocol ProfileUsecaseInterface {
    func getUserProfile() -> AnyPublisher<ProfileVO, Error>
    func putEditUserProfile(profile: ProfileEditVO) -> AnyPublisher<Int, Error>
}

final class ProfileUsecase: ProfileUsecaseInterface {
    
    let repository: ProfileRepository
    
    init(repository: ProfileRepository) {
        self.repository = repository
    }
    
    func getUserProfile() -> AnyPublisher<ProfileVO, Error> {
        return repository.getUserProfile()
    }
    
    func putEditUserProfile(profile: ProfileEditVO) -> AnyPublisher<Int, Error>  {
        return repository.putEditUserProfile(VO: profile)
    }
}
