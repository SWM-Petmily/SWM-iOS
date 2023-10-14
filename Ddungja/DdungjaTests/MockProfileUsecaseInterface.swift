//
//  MockProfileUsecaseInterface.swift
//  DdungjaTests
//
//  Created by 오승기 on 2023/09/12.
//

import Combine
@testable import Ddungja

final class MockProfileUsecaseInterface: ProfileUsecaseInterface {
    var getMyPageReturnValue: Result<MyPageVO, CustomErrorVO>?
    var getUserProfileReturnValue: Result<ProfileVO, CustomErrorVO>?
    var putEditUserProfileReturnValue: Result<Int, CustomErrorVO>?
    var postEditProfileReturnValue: Result<Int, CustomErrorVO>?
    var deleteUserInfoReturnValue: Result<Void, CustomErrorVO>?
    var putEditProfileCalled = false
    var postEditProfileCalled = false
    
    func getMyPage() -> AnyPublisher<MyPageVO, CustomErrorVO> {
        if let returnValue = getMyPageReturnValue {
            return Result.Publisher(returnValue)
                .eraseToAnyPublisher()
        } else {
            fatalError("getMyPageReturnValue not set in the mock")
        }
    }

    func getUserProfile() -> AnyPublisher<ProfileVO, CustomErrorVO> {
        if let returnValue = getUserProfileReturnValue {
            return Result.Publisher(returnValue)
                .eraseToAnyPublisher()
        } else {
            fatalError("getUserProfileReturnValue not set in the mock")
        }
    }

    func putEditUserProfile(profile: ProfileEditVO) -> AnyPublisher<Int, CustomErrorVO> {
        putEditProfileCalled.toggle()
        if let returnValue = putEditUserProfileReturnValue {
            return Result.Publisher(returnValue)
                .eraseToAnyPublisher()
        } else {
            fatalError("putEditUserProfileReturnValue not set in the mock")
        }
    }

    func postEditProfile(profile: ProfileEditVO) -> AnyPublisher<Int, CustomErrorVO> {
        postEditProfileCalled.toggle()
        if let returnValue = postEditProfileReturnValue {
            return Result.Publisher(returnValue)
                .eraseToAnyPublisher()
        } else {
            fatalError("postEditProfileReturnValue not set in the mock")
        }
    }
    
    func deleteUserInfo() -> AnyPublisher<Void, CustomErrorVO> {
        if let returnValue = deleteUserInfoReturnValue {
            return Result.Publisher(returnValue)
                .eraseToAnyPublisher()
        } else {
            fatalError("deleteUserInfo not set in the mock")
        }
    }
}
