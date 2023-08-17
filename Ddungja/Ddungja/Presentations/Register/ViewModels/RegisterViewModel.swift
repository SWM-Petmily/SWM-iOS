//
//  RegisterViewModel.swift
//  Ddungja
//
//  Created by 오승기 on 2023/08/05.
//

import Foundation
import Combine
import Swinject

enum Gender: String {
    case male = "MALE"
    case female = "FEMALE"
}

enum Neutered: String{
    case yes = "YES"
    case no = "NO"
}

final class RegisterViewModel: BaseViewModel {
    private var container: Container
    private let registerUsecase: RegisterUsecaseInterface
    private var cancellables = Set<AnyCancellable>()
    
    private(set) var isRegistered = true
    @Published var registeredPetInfo = [RegisteredPetVO]()
    @Published var images = Array(repeating: Data(), count: 5)
    
    @Published var petType = ""
    @Published var petName = ""
    @Published var region = ""
    @Published var gender = Gender.male.rawValue
    @Published var neutered = Neutered.yes.rawValue
    @Published var year = ""
    @Published var month = ""
    @Published var reason = ""
    @Published var advantage = ""
    @Published var disAdvantage = ""
    @Published var cost = ""
    @Published var adopter = ""
    
    init(container: Container, coordinator: CoordinatorProtocol, registerUsecase: RegisterUsecaseInterface) {
        self.container = container
        self.registerUsecase = registerUsecase
        
        super.init(coordinator: coordinator)
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
    
    func deleteRegisteredInfo(_ idx: Int) {
        let id = registeredPetInfo[idx].id
        registerUsecase.deleteRegisteredInfo(id)
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
            } receiveValue: { [weak self] _ in
                self?.registeredPetInfo.remove(at: idx)
            }
            .store(in: &cancellables)
    }
    
    func push(_ page: Page) {
        coordinator.push(page)
    }
    
    func userExitPost() {
        container.resetObjectScope(.exitSalePost)
    }
}
