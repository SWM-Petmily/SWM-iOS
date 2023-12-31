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
    
    func getAdditionalPageInfo(_ postId: Int) -> AnyPublisher<CertificationInfoVO, CustomErrorVO> {
        datasource.getAdditionalPageInfo(postId)
            .map { $0.toCertificationInfoVO() }
            .eraseToAnyPublisher()
    }
    
    func registerPetNumber(_ dto: RegisterPetNumberDTO) -> AnyPublisher<RegisterPetIdVO, CustomErrorVO> {
        datasource.registerPetNumber(dto)
            .map { $0.toRegisterPetIdVO() }
            .eraseToAnyPublisher()
    }
    
    func registerPetNumber(_ postId: Int, _ dto: RegisterPetNumberDTO) -> AnyPublisher<CertificationInfoVO, CustomErrorVO> {
        datasource.registerPetNumber(postId, dto)
            .map { $0.toCertificationInfoVO() }
            .eraseToAnyPublisher()
    }
    
    func registerPetHealthInfo(_ postId: Int, _ images: [UIImage]) -> AnyPublisher<CertificationInfoVO, CustomErrorVO> {
        datasource.registerPetHealthInfo(postId, images)
            .map { $0.toCertificationInfoVO() }
            .eraseToAnyPublisher()
    }
    
    func registerVaccineInfo(_ postId: Int, _ images: [UIImage]) -> AnyPublisher<CertificationInfoVO, CustomErrorVO> {
        datasource.registerVaccineInfo(postId, images)
            .map { $0.toCertificationInfoVO() }
            .eraseToAnyPublisher()
    }
}
