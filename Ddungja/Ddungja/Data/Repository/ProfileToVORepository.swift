//
//  ProfileToVORepository.swift
//  Ddungja
//
//  Created by 오승기 on 2023/07/06.
//

import Combine

final class ProfileToVORepository: ProfileRepository {
    
    let dataSource: UserProfileDataSourceInterface
    
    init(dataSource: UserProfileDataSourceInterface) {
        self.dataSource = dataSource
    }
    
    func getUserProfile() -> AnyPublisher<ProfileVO, CustomErrorVO> {
        return dataSource.getUserProfile().map { $0.toDomain() }.eraseToAnyPublisher()
    }
    
    func putEditUserProfile(VO: ProfileEditVO) -> AnyPublisher<Int, CustomErrorVO>{
        dataSource.putEditUserProfile(profile: VO)
            .map { $0.toDomain() }
            .eraseToAnyPublisher()
    }
}
