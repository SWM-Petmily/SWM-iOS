//
//  DetailPostViewModel.swift
//  Ddungja
//
//  Created by 오승기 on 2023/08/03.
//

import Foundation
import Combine

final class DetailPostViewModel: ObservableObject {
    private let coordinator: CoordinatorProtocol
    private let homeUsecase: HomeUsecaseInterface
    private var cancellables = Set<AnyCancellable>()
    
    @Published var detail: DetailPostVO?
    
    init(coordinator: CoordinatorProtocol, homeUsecase: HomeUsecaseInterface) {
        self.coordinator = coordinator
        self.homeUsecase = homeUsecase
    }
    
    func getDetailPost(_ id: Int) {
        homeUsecase.getDetailPost(id)
            .sink { error in
                print("getDetailPost error \(error)")
            } receiveValue: { [weak self] vo in
                self?.detail = vo
            }
            .store(in: &cancellables)
    }
}
