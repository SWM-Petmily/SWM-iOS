//
//  PetCertificationRepositoy.swift
//  Ddungja
//
//  Created by 오승기 on 2023/08/09.
//

import UIKit
import Combine

final class PetCertificationRepository: PetCertificationRepositoryInterface {
    private let datasource: PetCertificationDataSourceInterface
    
    init(datasource: PetCertificationDataSourceInterface) {
        self.datasource = datasource
    }
    
    func getAdditionalPageInfo(_ postId: Int) -> AnyPublisher<CertificationInfoVO, Error> {
        datasource.getAdditionalPageInfo(postId)
            .map { $0.toCertificationInfoVO() }
            .eraseToAnyPublisher()
    }
    
    func registerPetNumber(_ postId: Int, _ dto: RegisterPetNumberDTO) -> AnyPublisher<CertificationInfoVO, Error> {
        datasource.registerPetNumber(postId, dto)
            .map { $0.toCertificationInfoVO() }
            .eraseToAnyPublisher()
    }
    
    func registerPetHealthInfo(_ postId: Int, _ images: [UIImage]) -> AnyPublisher<CertificationInfoVO, Error> {
        datasource.registerPetHealthInfo(postId, images)
            .map { $0.toCertificationInfoVO() }
            .eraseToAnyPublisher()
    }
    
    func registerVaccineInfo(_ postId: Int, _ images: [UIImage]) -> AnyPublisher<CertificationInfoVO, Error> {
        datasource.registerVaccineInfo(postId, images)
            .map { $0.toCertificationInfoVO() }
            .eraseToAnyPublisher()
    }
}
