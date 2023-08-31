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
    func getMyPage() -> AnyPublisher<MyPageDTO, CustomErrorVO>
    func getUserProfile(_ userId: String) -> AnyPublisher<ProfileDetailDTO, CustomErrorVO>
    func putEditUserProfile(profile: ProfileEditVO) -> AnyPublisher<ProfileRegisterDTO, CustomErrorVO>
    func postEditUserProfile(profile: ProfileEditVO) -> AnyPublisher<ProfileRegisterDTO, CustomErrorVO>
}
    
final class UserProfileAPIProvider: UserProfileDataSourceInterface {
    let moyaProvider: MoyaProvider<UserProfileAPI>
    
    init(moyaProvider: MoyaProvider<UserProfileAPI> = .init()) {
        self.moyaProvider = moyaProvider
    }
    
    func getMyPage() -> AnyPublisher<MyPageDTO, CustomErrorVO> {
        moyaProvider.requestPublisher(.myPage)
            .asResult()
    }
    
    func getUserProfile(_ userId: String) -> AnyPublisher<ProfileDetailDTO, CustomErrorVO> {
        return moyaProvider.requestPublisher(.detail(userId: userId))
            .asResult()
    }
    
    func putEditUserProfile(profile: ProfileEditVO) -> AnyPublisher<ProfileRegisterDTO, CustomErrorVO> {
        let profileDTO = profile.toData(profile: profile)
        
        return moyaProvider.requestPublisher(.modify(userInfo: profileDTO))
            .asResult()
    }
    
    func postEditUserProfile(profile: ProfileEditVO) -> AnyPublisher<ProfileRegisterDTO, CustomErrorVO> {
        let profileDTO = profile.toData(profile: profile)
        return moyaProvider.requestPublisher(.register(userInfo: profileDTO))
            .asResult()
    }
}
