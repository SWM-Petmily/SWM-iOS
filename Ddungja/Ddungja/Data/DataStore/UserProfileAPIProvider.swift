//
//  UserProfileAPIProvider.swift
//  Ddungja
//
//  Created by 오승기 on 2023/06/28.
//

import Foundation
import Moya
import CombineMoya
import Combine

protocol UserProfileDataSourceInterface {
    func getUserProfile() -> AnyPublisher<ProfileDetailDTO, MoyaError>
    func putEditUserProfile(profile: ProfileEditVO)
}
    
final class UserProfileAPIProvider: UserProfileDataSourceInterface {
    let moyaProvider: MoyaProvider<UserProfileAPI>
    
    init(moyaProvider: MoyaProvider<UserProfileAPI> = .init()) {
        self.moyaProvider = moyaProvider
    }
    
    func getUserProfile() -> AnyPublisher<ProfileDetailDTO, MoyaError> {
        return moyaProvider.requestPublisher(.detail(userId: "1"))
            .retry(3)
            .eraseToAnyPublisher()
            .map(ProfileDetailDTO.self)
    }
    
    func putEditUserProfile(profile: ProfileEditVO) {
        let profileDTO = profile.toData(profile: profile)
        
        moyaProvider.requestPublisher(.modify(userInfo: profileDTO))
            .retry(3)
            .eraseToAnyPublisher()
            .map(ProfileRegisterDTO.self)
    }
}
