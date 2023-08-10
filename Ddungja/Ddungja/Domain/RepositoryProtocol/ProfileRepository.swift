//
//  ProfileRepository.swift
//  Ddungja
//
//  Created by 오승기 on 2023/07/06.
//

import Combine

protocol ProfileRepository {
    func getUserProfile() -> AnyPublisher<ProfileVO, Error>
    func putEditUserProfile(VO: ProfileEditVO) -> AnyPublisher<Int, Error>
}
