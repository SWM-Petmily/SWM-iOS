//
//  ProfileToVORepository.swift
//  Ddungja
//
//  Created by 오승기 on 2023/07/06.
//

import Combine
import Moya

final class ProfileToVORepository: ProfileRepository {
    
    let dataSource: UserProfileAPIProvider
    
    init(dataSource: UserProfileAPIProvider) {
        self.dataSource = dataSource
    }
    
    func getUserProfile() -> AnyPublisher<ProfileVO, MoyaError> {
        return dataSource.getUserProfile().map { $0.toDomain() }.eraseToAnyPublisher()
    }
}
