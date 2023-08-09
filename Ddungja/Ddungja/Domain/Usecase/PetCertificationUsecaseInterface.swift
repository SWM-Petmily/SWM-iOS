//
//  PetCertificationUsecaseInterface.swift
//  Ddungja
//
//  Created by 오승기 on 2023/08/08.
//

import Combine
import Moya
import UIKit

protocol PetCertificationUsecaseInterface {
    func getAdditionalPageInfo(_ postId: Int) -> AnyPublisher<CertificationInfoVO, MoyaError>
    func registerPetNumber(_ postId: Int, _ name: String, _ number: String) -> AnyPublisher<CertificationInfoVO, MoyaError>
    func registerPetHealthInfo(_ postId: Int, _ images: [Data]) -> AnyPublisher<CertificationInfoVO, MoyaError>
}

final class PetCertificationUsecase: PetCertificationUsecaseInterface {
    private let repository: PetCertificationRepositoryInterface
    
    init(repository: PetCertificationRepositoryInterface) {
        self.repository = repository
    }
    
    func getAdditionalPageInfo(_ postId: Int) -> AnyPublisher<CertificationInfoVO, MoyaError> {
        return repository.getAdditionalPageInfo(postId)
    }
    
    func registerPetNumber(_ postId: Int, _ name: String, _ number: String) -> AnyPublisher<CertificationInfoVO, MoyaError> {
        let dto = RegisterPetNumberDTO(ownerName: name, dogRegistrationNumber: number)
        return repository.registerPetNumber(postId, dto)
    }
    
    func registerPetHealthInfo(_ postId: Int, _ images: [Data]) -> AnyPublisher<CertificationInfoVO, MoyaError> {
        var userImages = [UIImage]()
        for image in images {
            if let uiImage = UIImage(data: image) {
                userImages.append(uiImage)
            }
        }
        
        return repository.registerPetHealthInfo(postId, userImages)
    }
}
