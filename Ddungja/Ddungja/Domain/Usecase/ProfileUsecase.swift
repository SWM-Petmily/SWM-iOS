//
//  ProfileUsecase.swift
//  Ddungja
//
//  Created by 오승기 on 2023/07/06.
//

import Combine

protocol ProfileUsecaseInterface {
    func getUserProfile() -> AnyPublisher<ProfileVO, CustomErrorVO>
    func putEditUserProfile(profile: ProfileEditVO) -> AnyPublisher<Int, CustomErrorVO>
}

final class ProfileUsecase: ProfileUsecaseInterface {
    
    let repository: ProfileRepository
    
    init(repository: ProfileRepository) {
        self.repository = repository
    }
    
    func getUserProfile() -> AnyPublisher<ProfileVO, CustomErrorVO> {
        return repository.getUserProfile()
    }
    
    func putEditUserProfile(profile: ProfileEditVO) -> AnyPublisher<Int, CustomErrorVO>  {
        return repository.putEditUserProfile(VO: profile)
    }
}
