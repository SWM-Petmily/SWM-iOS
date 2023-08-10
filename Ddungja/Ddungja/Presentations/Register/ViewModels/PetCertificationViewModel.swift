//
//  PetCertificationViewModel.swift
//  Ddungja
//
//  Created by 오승기 on 2023/08/08.
//

import Foundation
import Combine
import SwiftUI

final class PetCertificationViewModel: ObservableObject {
    private var coordinator: CoordinatorProtocol
    private let petCertificationUsecase: PetCertificationUsecaseInterface
    private var cancellables = Set<AnyCancellable>()
    
    @Published var registrationStatus = CertificationStatus.none.rawValue
    @Published var vaccinationStatus = CertificationStatus.none.rawValue
    @Published var healthScreeningStatus = CertificationStatus.none.rawValue
    
    @Published var name = ""
    @Published var registrationNumber = ""
    @Published var healthInfoImages = Array(repeating: Data(), count: 5)
    @Published var vaccineInfoImages = Array(repeating: Data(), count: 5)
    
    init(coordinator: CoordinatorProtocol, petCertificationUsecase: PetCertificationUsecaseInterface) {
        self.coordinator = coordinator
        self.petCertificationUsecase = petCertificationUsecase
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
    
    func registerPetNumber(_ postId: Int) {
        petCertificationUsecase.registerPetNumber(postId, name, registrationNumber)
            .sink { completion in
                print("getAdditionalPageInfo \(completion)")
            } receiveValue: { [weak self] vo in
                guard let self = self else { return }
                print("register number \(vo)")
            }
            .store(in: &cancellables)
    }
    
    func registerPetHealthInfo(_ postId: Int) {
        petCertificationUsecase.registerPetHealthInfo(postId, healthInfoImages)
            .sink { completion in
                print("getAdditionalPageInfo \(completion)")
            } receiveValue: { [weak self] vo in
                guard let self = self else { return }
                print("register number \(vo)")
            }
            .store(in: &cancellables)
    }
    
    func registerVaccineInfo(_ postId: Int) {
        petCertificationUsecase.registerVaccineInfo(postId, vaccineInfoImages)
            .sink { completion in
                print("registerVaccineInfo \(completion)")
            } receiveValue: { [weak self] vo in
                guard let self = self else { return }
                print("registerVaccineInfo \(vo)")
            }
            .store(in: &cancellables)
    }
    
    func push(_ page: Page) {
        coordinator.push(page)
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
