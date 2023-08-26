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

final class RegisterViewModel: BaseViewModel, RegionInterface {
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
    
    func registerPost() {
        let vo = PetPostVO(mainCategory: "강아지", subCategory: petType, name: petName, region: region, gender: gender, birth: "\(year)-\(month)", neutered: neutered, money: 0, reason: reason, advantage: advantage, disadvantage: disAdvantage, averageCost: cost, adopter: adopter, status: "SAVE", diseases: [], isRegistered: isRegistered)
    
        registerUsecase.registerPost(vo, images)
            .sink { completion in
                print("RegisterPost completion \(completion)")
            } receiveValue: { [weak self] vo in
                self?.push(.petCertification(postId: vo.postId))
            }
            .store(in: &cancellables)
    }
    
    func updateRegion(_ newRegion: String) {
        region = newRegion
    }
    
    func userExitPost() {
        container.resetObjectScope(.exitSalePost)
    }
}
