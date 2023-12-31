//
//  PetCertificationViewModel.swift
//  Ddungja
//
//  Created by 오승기 on 2023/08/08.
//

import Foundation
import Combine
import SwiftUI
import PhotosUI

enum PetHealthData {
    case healtInfo
    case vaccineInfo
}

final class PetCertificationViewModel: BaseViewModel, PhotoPickerInterface {
    private let petCertificationUsecase: PetCertificationUsecaseInterface
    private var cancellables = Set<AnyCancellable>()
    
    @Published var registrationStatus = CertificationStatus.none.rawValue
    @Published var vaccinationStatus = CertificationStatus.none.rawValue
    @Published var healthScreeningStatus = CertificationStatus.none.rawValue
    
    @Published var name = ""
    @Published var registrationNumber = ""
    @Published var selectedPhotoItem: [PhotosPickerItem] = []
    @Published var image = Array(repeating: Data(), count: 5)
    @Published var isShowModal = false
    
    init(coordinator: CoordinatorProtocol, petCertificationUsecase: PetCertificationUsecaseInterface) {
        self.petCertificationUsecase = petCertificationUsecase
        
        super.init(coordinator: coordinator)
    }
    
    func getAdditionalPageInfo(_ postId: Int) {
        petCertificationUsecase.getAdditionalPageInfo(postId)
            .sink { completion in
                print("getAdditionalPageInfo \(completion)")
            } receiveValue: { [weak self] vo in
                guard let self = self else { return }
                self.registrationStatus = vo.isRegistered
                self.vaccinationStatus = vo.isVaccinated
                self.healthScreeningStatus = vo.isMedicalChecked
            }
            .store(in: &cancellables)
    }
    
    func registerPetNumber(_ postId: Int?) {
        if let postId = postId {
            registerPetNumber(postId)
        } else {
            registerPetNumber()
        }
    }
    
    private func registerPetNumber() {
        petCertificationUsecase.registerPetNumber(name, registrationNumber)
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
            } receiveValue: { [weak self] vo in
                self?.isShowModal = true
                print(vo)
            }
            .store(in: &cancellables)
    }
    
    private func registerPetNumber(_ postId: Int) {
        petCertificationUsecase.registerPetNumber(postId, name, registrationNumber)
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
            } receiveValue: { [weak self] vo in
                guard let self = self else { return }
                self.isShowModal = true
                print("register number \(vo)")
            }
            .store(in: &cancellables)
    }
    
    func registerPetInfo(_ type: PetHealthData, _ postId: Int) {
        if type == .healtInfo {
            registerPetHealthInfo(postId)
        } else {
            registerVaccineInfo(postId)
        }
    }
    
    private func registerPetHealthInfo(_ postId: Int) {
        petCertificationUsecase.registerPetHealthInfo(postId, image)
            .sink { [weak self] completion in
                guard let self = self else { return }
                switch completion {
                case .finished:
                    break
                case let .failure(error):
                    self.showAlert = true
                    self.errorTitle = error.title
                    self.errorDetailMessage = error.detailMessage
                }
            } receiveValue: { [weak self] vo in
                guard let self = self else { return }
                self.isShowModal = true
                print("register number \(vo)")
            }
            .store(in: &cancellables)
    }
    
    private func registerVaccineInfo(_ postId: Int) {
        petCertificationUsecase.registerVaccineInfo(postId, image)
            .sink { [weak self] completion in
                guard let self = self else { return }
                switch completion {
                case .finished:
                    break
                case let .failure(error):
                    self.showAlert = true
                    self.errorTitle = error.title
                    self.errorDetailMessage = error.detailMessage
                }
            } receiveValue: { [weak self] vo in
                guard let self = self else { return }
                self.isShowModal = true
                print("registerVaccineInfo \(vo)")
            }
            .store(in: &cancellables)
    }
    
    func updateImage(_ data: Data, index: Int) {
        image[index] = data
    }
    
    func popToRoot() {
        coordinator.popToRoot()
    }
}

extension PetCertificationViewModel {
    enum CertificationStatus: String {
        case none = "NONE"
        case certified = "CERTIFIED"
        case reject = "REJECT"
        case waiting = "WAITING"
    }
}
