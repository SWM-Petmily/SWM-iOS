//
//  ApplyCommonViewModel.swift
//  Ddungja
//
//  Created by 오승기 on 2023/08/04.
//

import Combine

final class ApplyCommonViewModel: ObservableObject {
    private let myPostsUsecase: MyApplyPostsUsecaseInterface
    private let profileUsecase: ProfileUsecaseInterface
    private var cancellables = Set<AnyCancellable>()
    @Published var profile: ProfileVO
    
    init(myPostsUsecase: MyApplyPostsUsecaseInterface,profileUsecase: ProfileUsecaseInterface) {
        self.myPostsUsecase = myPostsUsecase
        self.profileUsecase = profileUsecase
        self.profile = ProfileVO(job: "", environment: "", people: -1, comment: "", openTalk: "", region: "", isExperience: false, nickname: "", profileImageId: 1, profileImage: "bulldog", experiences: [])
    }
    
    func getProfile() {
        profileUsecase.getUserProfile()
            .sink { completion in
                print("getApplyInfo \(completion)")
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
