//
//  UserProfileViewModel.swift
//  Ddungja
//
//  Created by 오승기 on 2023/07/06.
//

import Foundation
import Combine

final class UserProfileViewModel: ObservableObject {
    private let profileUsecase: ProfileUsecaseInterface
    private var cancellabels = Set<AnyCancellable>()
    @Published var profile: ProfileVO?
    
    init(profileUsecase: ProfileUsecaseInterface) {
        self.profileUsecase = profileUsecase
        getProfile()
    }
    
    private func getProfile() {
        profileUsecase.getUserProfile()
            .sink { errpr in
                print("Cheeck \(errpr)")
            } receiveValue: { profileVo in
                print(profileVo)
                self.profile = profileVo
            }
            .store(in: &cancellabels)        
    }
}
