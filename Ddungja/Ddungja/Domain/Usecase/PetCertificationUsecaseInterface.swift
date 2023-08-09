//
//  PetCertificationUsecaseInterface.swift
//  Ddungja
//
//  Created by 오승기 on 2023/08/08.
//

import Foundation

protocol PetCertificationUsecaseInterface {
    func getAdditionalPageInfo(_ postId: Int)
}

final class PetCertificationUsecase: PetCertificationUsecaseInterface {
    private let repository: PetCertificationRepositoryInterface
    
    init(repository: PetCertificationRepositoryInterface) {
        self.repository = repository
    }
    
    func getAdditionalPageInfo(_ postId: Int) {
        repository.getAdditionalPageInfo(postId)
    }
}
