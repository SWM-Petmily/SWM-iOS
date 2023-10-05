//
//  RegisterViewModel.swift
//  Ddungja
//
//  Created by 오승기 on 2023/08/05.
//

import Foundation
import Combine
import Swinject
import SwiftUI
import PhotosUI

enum Gender: String {
    case male = "MALE"
    case female = "FEMALE"
}

enum Neutered: String{
    case yes = "YES"
    case no = "NO"
}

final class RegisterViewModel: BaseViewModel, RegionInterface, PhotoPickerInterface {
    
    private var container: Container
    private let registerUsecase: RegisterUsecaseInterface
    private var cancellables = Set<AnyCancellable>()
    private let date = DateFormatter()
    private(set) var isRegistered = true
    @Published var registeredPetInfo = [RegisteredPetVO]()
    @Published var images = Array(repeating: Data(), count: 5)
    @Published var selectedPhotoItem: [PhotosPickerItem] = []
    
    @Published var petType = ""
    @Published var petName = ""
    @Published var region = ""
    @Published var gender = Gender.male.rawValue
    @Published var neutered = Neutered.yes.rawValue
    @Published var year = "" {
        didSet { if !year.isEmpty && Int(year) == nil { year = oldValue } }
    }
    @Published var month = "" {
        didSet { if !month.isEmpty && Int(month) == nil { month = oldValue } }
    }
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
    
    func updateImage(_ data: Data, index: Int) {
        images[index] = data
    }
    
    func userExitPost() {
        container.resetObjectScope(.exitSalePost)
    }
    
    func registerPetInfo() -> Toast? {
        date.dateFormat = "yyyy"
        if region.isEmpty || month.isEmpty || year.isEmpty {
            return Toast(type: .error, title: "유효하지 않은 값", message: "빠짐없이 작성해주세요")
        } else if year.count != 4 {
            return Toast(type: .error, title: "년을 확인해주세요", message: "yyyy 형식으로 입력해주세요")
        } else if year > date.string(from: Date()) {
            return Toast(type: .error, title: "년을 확인해주세요", message: "현재 년도보다 클 수 없습니다.")
        } else if Int(month)! < 1 || Int(month)! > 12 {
            return Toast(type: .error, title: "월을 확인해주세요", message: "입력된 월이 잘못되었습니다.")
        } else {
            push(.adoptionReason)
            return nil
        }
    }
    
    func registerAdoptionReason() -> Toast? {
        if reason.count < 20 {
            return Toast(type: .error, title: "내용이 부족합니다.", message: "20자 이상 작성해주세요")
        } else {
            push(.petAdvantage)
            return nil
        }
    }
    
    func registerAdvantage() -> Toast? {
        if advantage.count < 20 {
            return Toast(type: .error, title: "내용이 부족합니다.", message: "20자 이상 작성해주세요")
        } else {
            push(.petDisadvantage)
            return nil
        }
    }
}
