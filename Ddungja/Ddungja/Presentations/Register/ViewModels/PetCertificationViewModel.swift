//
//  PetCertificationViewModel.swift
//  Ddungja
//
//  Created by 오승기 on 2023/08/08.
//

import Foundation
import Combine

final class PetCertificationViewModel: ObservableObject {
    private var coordinator: CoordinatorProtocol
    private let petCertificationUsecase: PetCertificationUsecaseInterface
    private var cancellables = Set<AnyCancellable>()
    
    init(coordinator: CoordinatorProtocol, petCertificationUsecase: PetCertificationUsecaseInterface) {
        self.coordinator = coordinator
        self.petCertificationUsecase = petCertificationUsecase
    }
    
    func getAdditionalPageInfo(_ postId: Int) {
        petCertificationUsecase.getAdditionalPageInfo(postId)
    }
    func push(_ page: Page) {
        coordinator.push(page)
    }
}
