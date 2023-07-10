//
//  ProfileRepository.swift
//  Ddungja
//
//  Created by 오승기 on 2023/07/06.
//

import Combine
import Moya

protocol ProfileRepository {
    func getUserProfile() -> AnyPublisher<ProfileVO, MoyaError>
    func putEditUserProfile(VO: ProfileEditVO) -> AnyPublisher<Int, MoyaError>
}
