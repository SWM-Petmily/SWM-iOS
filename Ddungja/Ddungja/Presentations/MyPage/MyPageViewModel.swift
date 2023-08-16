//
//  MyPageViewModel.swift
//  Ddungja
//
//  Created by 오승기 on 2023/07/13.
//

import Foundation
import Combine

final class MyPageViewModel: BaseViewModel {
    private let profileUsecase: ProfileUsecaseInterface
    private var cancellables = Set<AnyCancellable>()
    
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
                }
            } receiveValue: { [weak self] vo in
                print(vo)
            }
            .store(in: &cancellables)
    }
}
