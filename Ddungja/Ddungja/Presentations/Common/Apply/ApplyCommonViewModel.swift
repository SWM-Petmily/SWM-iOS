//
//  ApplyCommonViewModel.swift
//  Ddungja
//
//  Created by 오승기 on 2023/08/04.
//

import Combine

final class ApplyCommonViewModel: BaseViewModel {
    private let myPostsUsecase: MyApplyPostsUsecaseInterface
    private let profileUsecase: ProfileUsecaseInterface
    private var cancellables = Set<AnyCancellable>()
    @Published var profile: ProfileVO
    init(coordinator: CoordinatorProtocol,myPostsUsecase: MyApplyPostsUsecaseInterface,profileUsecase: ProfileUsecaseInterface) {
        self.myPostsUsecase = myPostsUsecase
        self.profileUsecase = profileUsecase
        self.profile = ProfileVO(job: "", environment: "", people: -1, comment: "", openTalk: "", region: "", isExperience: false, nickname: "", profileImageId: 1, profileImage: "bulldog", experiences: [])
        
        super.init(coordinator: coordinator)
    }
    
    func getProfile() {
        profileUsecase.getUserProfile()
            .sink { [weak self] completion in
                guard let self = self else { return }
                switch completion {
                case .finished:
                    break
                case let .failure(error):
                    self.showAlert = true
                    self.errorTitle = error.title
                    self.errorDetailMessage = error.detailMessage
                    self.errorIcon = error.icon
                    self.errorIconColor = error.iconColor
                }
            } receiveValue: { profileVo in
                print(profileVo)
                self.profile = profileVo
            }
            .store(in: &cancellables)
    }
    
    func postApply(_ postId: Int) {
        myPostsUsecase.postApply(postId, profile)
            .sink { error in
                print("postApply \(error)")
            } receiveValue: { [weak self] vo in
                print(vo)
            }
            .store(in: &cancellables)
    }
}
