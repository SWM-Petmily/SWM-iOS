//
//  MyPageViewModel.swift
//  Ddungja
//
//  Created by 오승기 on 2023/07/13.
//

import SwiftUI
import Combine

final class MyPageViewModel: BaseViewModel {
    private let profileUsecase: ProfileUsecaseInterface
    private var cancellables = Set<AnyCancellable>()
    
    @Published var nickName = ""
    @Published var isProfile = false
    @Published var likeCount = 0
    @Published var applyCount = 0
    @Published var imageURL = ""
    @Published var isAppear = true
    
    init(coordinator: CoordinatorProtocol, profileUsecase: ProfileUsecaseInterface) {
        self.profileUsecase = profileUsecase
        
        super.init(coordinator: coordinator)
    }
    
    func getMyPage() {
        profileUsecase.getMyPage()
            .sink { [weak self] completion in
                guard let self = self else { return }
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print(error)
                    self.showAlert = true
                    self.errorTitle = error.title
                    self.errorDetailMessage = error.detailMessage
                    self.errorIcon = error.icon
                    self.errorIconColor = error.iconColor
                }
            } receiveValue: { [weak self] vo in
                print(vo)
                guard let self = self else { return }
                self.nickName = vo.nickname
                self.isProfile = vo.isProfile
                self.likeCount = vo.likeCount
                self.applyCount = vo.applyCount
                self.imageURL = vo.imageUrl
            }
            .store(in: &cancellables)
    }
    
    func changeProfileText() -> String {
        return isProfile ? "프로필 보기" : "프로필 작성하기"
    }
    
    func deleteUserInfo() {
        profileUsecase.deleteUserInfo()
            .sink { _ in
                print("deleteUserInfo failed")
            } receiveValue: { _ in
                KeyChainManager.delete(key: .accessToken)
                KeyChainManager.delete(key: .refreshToken)
                self.coordinator.popToRoot()
                print("deleteUserInfo success")
            }
            .store(in: &cancellables)
    }
    
    func push() {
        if isProfile {
            coordinator.push(.userProfileView)
        } else {
            coordinator.push(.editProfile(isRegister: false))
        }
    }
}
