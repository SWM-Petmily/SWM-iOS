//
//  PetCertificationUsecaseInterface.swift
//  Ddungja
//
//  Created by 오승기 on 2023/08/08.
//

import Combine
import UIKit

protocol PetCertificationUsecaseInterface {
    func getAdditionalPageInfo(_ postId: Int) -> AnyPublisher<CertificationInfoVO, Error>
    func registerPetNumber(_ postId: Int, _ name: String, _ number: String) -> AnyPublisher<CertificationInfoVO, Error>
    func registerPetHealthInfo(_ postId: Int, _ images: [Data]) -> AnyPublisher<CertificationInfoVO, Error>
    func registerVaccineInfo(_ postId: Int, _ images: [Data]) -> AnyPublisher<CertificationInfoVO, Error>
}

final class PetCertificationUsecase: PetCertificationUsecaseInterface {
    private let repository: PetCertificationRepositoryInterface
    
    init(repository: PetCertificationRepositoryInterface) {
        self.repository = repository
    }
    
    func getAdditionalPageInfo(_ postId: Int) -> AnyPublisher<CertificationInfoVO, Error> {
        return repository.getAdditionalPageInfo(postId)
    }
    
    func registerPetNumber(_ postId: Int, _ name: String, _ number: String) -> AnyPublisher<CertificationInfoVO, Error> {
        let dto = RegisterPetNumberDTO(ownerName: name, dogRegistrationNumber: number)
        return repository.registerPetNumber(postId, dto)
    }
    
    func registerPetHealthInfo(_ postId: Int, _ images: [Data]) -> AnyPublisher<CertificationInfoVO, Error> {
        var userImages = [UIImage]()
        for image in images {
            if let uiImage = UIImage(data: image) {
                userImages.append(uiImage)
            }
        }
        
        return repository.registerPetHealthInfo(postId, userImages)
    }
    
    func registerVaccineInfo(_ postId: Int, _ images: [Data]) -> AnyPublisher<CertificationInfoVO, Error> {
        var userImages = [UIImage]()
        for image in images {
            if let uiImage = UIImage(data: image) {
                userImages.append(uiImage)
            }
        }
        
        return repository.registerVaccineInfo(postId, userImages)
    }
}
