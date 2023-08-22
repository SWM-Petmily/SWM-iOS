//
//  CertificationAPIProvider.swift
//  Ddungja
//
//  Created by 오승기 on 2023/08/09.
//

import UIKit
import CombineMoya
import Moya
import Combine

protocol PetCertificationDataSourceInterface {
    func getAdditionalPageInfo(_ postId: Int) -> AnyPublisher<CertificationInfoDTO, CustomErrorVO>
    func registerPetNumber(_ dto: RegisterPetNumberDTO) -> AnyPublisher<RegisterPetIdDTO, CustomErrorVO>
    func registerPetNumber(_ postId: Int, _ dto: RegisterPetNumberDTO) -> AnyPublisher<CertificationInfoDTO, CustomErrorVO>
    func registerPetHealthInfo(_ postId: Int, _ images: [UIImage]) -> AnyPublisher<CertificationInfoDTO, CustomErrorVO>
    func registerVaccineInfo(_ postId: Int, _ images: [UIImage]) -> AnyPublisher<CertificationInfoDTO, CustomErrorVO>
}

final class CertificationAPIProvider: PetCertificationDataSourceInterface {
    private let moyaProvider: MoyaProvider<CertificationAPI>
    
    init(moyaProvider: MoyaProvider<CertificationAPI> = .init()) {
        self.moyaProvider = moyaProvider
    }
    
    func getAdditionalPageInfo(_ postId: Int) -> AnyPublisher<CertificationInfoDTO, CustomErrorVO> {
        moyaProvider.requestPublisher(.getAdditionalPage(postId: postId))
            .asResult()
    }
    
    func registerPetNumber(_ dto: RegisterPetNumberDTO) -> AnyPublisher<RegisterPetIdDTO, CustomErrorVO> {
        moyaProvider.requestPublisher(.registerUsersPetNumber(dto: dto))
            .asResult()
    }
    
    func registerPetNumber(_ postId: Int, _ dto: RegisterPetNumberDTO) -> AnyPublisher<CertificationInfoDTO, CustomErrorVO>  {
        moyaProvider.requestPublisher(.registerPetNumber(postId: postId, dto: dto))
            .asResult()
    }
    
    func registerPetHealthInfo(_ postId: Int, _ images: [UIImage]) -> AnyPublisher<CertificationInfoDTO, CustomErrorVO> {
        moyaProvider.requestPublisher(.registerHealthInfo(postId: postId, images: images))
            .asResult()
    }
    
    func registerVaccineInfo(_ postId: Int, _ images: [UIImage]) -> AnyPublisher<CertificationInfoDTO, CustomErrorVO> {
        moyaProvider.requestPublisher(.registerVaccineInfo(postId: postId, images: images))
            .asResult()
    }
}
