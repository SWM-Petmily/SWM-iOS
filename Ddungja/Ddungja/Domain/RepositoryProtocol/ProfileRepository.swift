//
//  ProfileRepository.swift
//  Ddungja
//
//  Created by 오승기 on 2023/07/06.
//

import Combine

protocol ProfileRepository {
    func getUserProfile() -> AnyPublisher<ProfileVO, CustomErrorVO>
    func putEditUserProfile(VO: ProfileEditVO) -> AnyPublisher<Int, CustomErrorVO>
}
