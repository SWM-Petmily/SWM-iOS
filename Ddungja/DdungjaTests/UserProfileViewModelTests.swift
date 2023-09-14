//
//  UserProfileViewModelTests.swift
//  DdungjaTests
//
//  Created by 오승기 on 2023/06/19.
//

import XCTest
import Combine
@testable import Ddungja

class UserProfileViewModelTests: XCTestCase {
    var viewModel: UserProfileViewModel!
    var profileUsecaseMock: MockProfileUsecaseInterface!
    var coordinatorMock: MockCoordinator!
    var cancellables: Set<AnyCancellable>!

    override func setUp() {
        super.setUp()
        coordinatorMock = MockCoordinator()
        profileUsecaseMock = MockProfileUsecaseInterface()
        viewModel = UserProfileViewModel(coordinator: coordinatorMock, profileUsecase: profileUsecaseMock)
        cancellables = Set<AnyCancellable>()
    }

    override func tearDown() {
        viewModel = nil
        profileUsecaseMock = nil
        coordinatorMock = nil
        cancellables = nil
        super.tearDown()
    }

    // getProfile 메서드를 테스트합니다.
    func test_getProfile_is_Success() {
        // Give
        let profileVo = ProfileVO(job: "학생", environment: "원룸", people: 3, comment: "열실히 키우겠습니다", openTalk: "www.kakaotalk.com", region: "서울", isExperience: false, nickname: "Test", profileImageId: 2, profileImage: "", experiences: [], isMyProfile: true)
        profileUsecaseMock.getUserProfileReturnValue = .success(profileVo)

        // When
        viewModel.getProfile()

        // Then
        XCTAssertEqual(viewModel.nickname, profileVo.nickname)
        XCTAssertEqual(viewModel.person, profileVo.people)
        XCTAssertEqual(viewModel.region, profileVo.region)
    }
    
    func test_getProfile_is_Fail() {
        // Give
        let errorVo = CustomErrorVO(code: 0, status: "", message: "", title: "Error", detailMessage: "Failed to retrieve user profile", icon: "", iconColor: "")
        profileUsecaseMock.getUserProfileReturnValue = .failure(errorVo)

        // When
        viewModel.getProfile()

        // Then
        XCTAssertTrue(viewModel.showAlert) // showAlert 프로퍼티가 true여야 합니다.
        XCTAssertEqual(viewModel.errorTitle, "Error") // 예상된 에러 타이틀
        XCTAssertEqual(viewModel.errorDetailMessage, "Failed to retrieve user profile")
    }
}
