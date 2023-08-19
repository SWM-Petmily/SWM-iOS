//
//  ProfileUsecase.swift
//  Ddungja
//
//  Created by 오승기 on 2023/07/06.
//

import Combine

protocol ProfileUsecaseInterface {
    func getMyPage() -> AnyPublisher<MyPageVO, CustomErrorVO>
    func getUserProfile() -> AnyPublisher<ProfileVO, CustomErrorVO>
    func putEditUserProfile(profile: ProfileEditVO) -> AnyPublisher<Int, CustomErrorVO>
    func postEditProfile(profile: ProfileEditVO) -> AnyPublisher<Int, CustomErrorVO>
}

final class ProfileUsecase: ProfileUsecaseInterface {
    
    let repository: ProfileRepository
    
    init(repository: ProfileRepository) {
        self.repository = repository
    }
    
    func getMyPage() -> AnyPublisher<MyPageVO, CustomErrorVO> {
        return repository.getMyPage()
    }
    
    func getUserProfile() -> AnyPublisher<ProfileVO, CustomErrorVO> {
        return repository.getUserProfile()
    }
    
    func putEditUserProfile(profile: ProfileEditVO) -> AnyPublisher<Int, CustomErrorVO>  {
        return repository.putEditUserProfile(VO: profile)
    }
    
    func postEditProfile(profile: ProfileEditVO) -> AnyPublisher<Int, CustomErrorVO> {
        return repository.postEditUserProfile(VO: profile)
    }
}
