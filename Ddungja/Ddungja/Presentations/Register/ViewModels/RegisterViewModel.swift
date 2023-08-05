//
//  RegisterViewModel.swift
//  Ddungja
//
//  Created by 오승기 on 2023/08/05.
//

import Foundation
import Combine

final class RegisterViewModel: ObservableObject {
    private var coordinator: CoordinatorProtocol
    private let registerUsecase: RegisterUsecaseInterface
    private var cancellables = Set<AnyCancellable>()
    
    @Published var registeredPetInfo = [RegisteredPetVO]()
    init(coordinator: CoordinatorProtocol, registerUsecase: RegisterUsecaseInterface) {
        self.coordinator = coordinator
        self.registerUsecase = registerUsecase
    }
    
    func getRegisteredPet() {
        registerUsecase.getRegisteredPet()
            .sink { error in
                print(error)
            } receiveValue: { [weak self] vo in
                self?.registeredPetInfo = vo
            }
            .store(in: &cancellables)
    }
}
