//
//  UserProfileViewModel.swift
//  Ddungja
//
//  Created by 오승기 on 2023/07/06.
//

import Foundation
import Combine

protocol UserProfileViewModelInterface {
    func getProfile()
}

final class UserProfileViewModel: ObservableObject {
    private let profileUsecase: ProfileUsecase
    private var cancellabels = Set<AnyCancellable>()
    @Published var profile: ProfileVO?
    
    init(profileUsecase: ProfileUsecase) {
        self.profileUsecase = profileUsecase
        getProfile()
    }
    
    func getProfile() {
        profileUsecase.getUserProfile()
//            .deb
            .sink { errpr in
                print("Cheeck \(errpr)")
            } receiveValue: { profileVo in
                print(profileVo)
                self.profile = profileVo
            }
            .store(in: &cancellabels)

            
    }
}
