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

final class RegisterViewModel: ObservableObject {
    private var container: Container
    private var coordinator: CoordinatorProtocol
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
    
    func registerPost() {
        let vo = PetPostVO(mainCategory: "강아지", subCategory: petType, name: petName, region: region, gender: gender, birth: "\(year)-\(month)", neutered: neutered, money: 0, reason: reason, advantage: advantage, disadvantage: disAdvantage, averageCost: cost, adopter: adopter, status: "SAVE", diseases: [], isRegistered: isRegistered)

        registerUsecase.registerPost(vo, images)
    }
    
    func push(_ page: Page) {
        coordinator.push(page)
    }
    
    func userExitPost() {
        container.resetObjectScope(.exitSalePost)
    }
}
