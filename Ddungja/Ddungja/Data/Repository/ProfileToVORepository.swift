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
    
    func getMyPage() -> AnyPublisher<MyPageVO, CustomErrorVO> {
        return dataSource.getMyPage()
            .map { $0.toMyPageVO() }
            .eraseToAnyPublisher()
    }
    
    func getUserProfile(_ userId: String) -> AnyPublisher<ProfileVO, CustomErrorVO> {
        return dataSource.getUserProfile(userId).map { $0.toDomain() }.eraseToAnyPublisher()
    }
    
    func putEditUserProfile(VO: ProfileEditVO) -> AnyPublisher<Int, CustomErrorVO> {
        dataSource.putEditUserProfile(profile: VO)
            .map { $0.toDomain() }
            .eraseToAnyPublisher()
    }
    
    func postEditUserProfile(VO: ProfileEditVO) -> AnyPublisher<Int, CustomErrorVO> {
        return dataSource.postEditUserProfile(profile: VO)
            .map { $0.toDomain() }
            .eraseToAnyPublisher()
    }
}
