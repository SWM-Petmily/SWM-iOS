//
//  HomeViewModel.swift
//  Ddungja
//
//  Created by 오승기 on 2023/08/01.
//

import Foundation

final class HomeViewModel: ObservableObject {
    private let coordinator: CoordinatorProtocol
    private let homeUsecase: HomeUsecaseInterface
    
    init(coordinator: CoordinatorProtocol, homeUsecase: HomeUsecaseInterface) {
        self.coordinator = coordinator
        self.homeUsecase = homeUsecase
    }
    
    func getMainPost() {
        homeUsecase.getMainPost()
    }
}
