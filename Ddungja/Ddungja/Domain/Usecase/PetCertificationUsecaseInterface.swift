//
//  PetCertificationUsecaseInterface.swift
//  Ddungja
//
//  Created by 오승기 on 2023/08/08.
//

import Combine
import UIKit

protocol PetCertificationUsecaseInterface {
    func getAdditionalPageInfo(_ postId: Int) -> AnyPublisher<CertificationInfoVO, CustomErrorVO>
    func registerPetNumber(_ name: String, _ number: String) -> AnyPublisher<RegisterPetIdVO, CustomErrorVO>
    func registerPetNumber(_ postId: Int, _ name: String, _ number: String) -> AnyPublisher<CertificationInfoVO, CustomErrorVO>
    func registerPetHealthInfo(_ postId: Int, _ images: [Data]) -> AnyPublisher<CertificationInfoVO, CustomErrorVO>
    func registerVaccineInfo(_ postId: Int, _ images: [Data]) -> AnyPublisher<CertificationInfoVO, CustomErrorVO>
}

final class PetCertificationUsecase: PetCertificationUsecaseInterface {
    private let repository: PetCertificationRepositoryInterface
    
    init(repository: PetCertificationRepositoryInterface) {
        self.repository = repository
    }
    
    func getAdditionalPageInfo(_ postId: Int) -> AnyPublisher<CertificationInfoVO, CustomErrorVO> {
        return repository.getAdditionalPageInfo(postId)
    }
    
    func registerPetNumber(_ name: String, _ number: String) -> AnyPublisher<RegisterPetIdVO, CustomErrorVO> {
        let dto = RegisterPetNumberDTO(ownerName: name, dogRegistrationNumber: number)
        return repository.registerPetNumber(dto)
    }
    
    func registerPetNumber(_ postId: Int, _ name: String, _ number: String) -> AnyPublisher<CertificationInfoVO, CustomErrorVO> {
        let dto = RegisterPetNumberDTO(ownerName: name, dogRegistrationNumber: number)
        return repository.registerPetNumber(postId, dto)
    }
    
    func registerPetHealthInfo(_ postId: Int, _ images: [Data]) -> AnyPublisher<CertificationInfoVO, CustomErrorVO> {
        var userImages = [UIImage]()
        for image in images {
            if let uiImage = UIImage(data: image) {
                userImages.append(uiImage)
            }
        }
        
        return repository.registerPetHealthInfo(postId, userImages)
    }
    
    func registerVaccineInfo(_ postId: Int, _ images: [Data]) -> AnyPublisher<CertificationInfoVO, CustomErrorVO> {
        var userImages = [UIImage]()
        for image in images {
            if let uiImage = UIImage(data: image) {
                userImages.append(uiImage)
            }
        }
        
        return repository.registerVaccineInfo(postId, userImages)
    }
}
