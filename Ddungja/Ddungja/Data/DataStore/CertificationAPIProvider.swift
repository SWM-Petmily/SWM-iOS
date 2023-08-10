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
    func getAdditionalPageInfo(_ postId: Int) -> AnyPublisher<CertificationInfoDTO, Error>
    func registerPetNumber(_ postId: Int, _ dto: RegisterPetNumberDTO) -> AnyPublisher<CertificationInfoDTO, Error>
    func registerPetHealthInfo(_ postId: Int, _ images: [UIImage]) -> AnyPublisher<CertificationInfoDTO, Error>
    func registerVaccineInfo(_ postId: Int, _ images: [UIImage]) -> AnyPublisher<CertificationInfoDTO, Error>
}

final class CertificationAPIProvider: PetCertificationDataSourceInterface {
    private let moyaProvider: MoyaProvider<CertificationAPI>
    
    init(moyaProvider: MoyaProvider<CertificationAPI> = .init()) {
        self.moyaProvider = moyaProvider
    }
    
    func getAdditionalPageInfo(_ postId: Int) -> AnyPublisher<CertificationInfoDTO, Error> {
        moyaProvider.requestPublisher(.getAdditionalPage(postId: 401))
            .asResult()
    }
    
    func registerPetNumber(_ postId: Int, _ dto: RegisterPetNumberDTO) -> AnyPublisher<CertificationInfoDTO, Error>  {
        moyaProvider.requestPublisher(.registerPetNumber(postId: postId, dto: dto))
            .asResult()
    }
    
    func registerPetHealthInfo(_ postId: Int, _ images: [UIImage]) -> AnyPublisher<CertificationInfoDTO, Error> {
        moyaProvider.requestPublisher(.registerHealthInfo(postId: postId, images: images))
            .asResult()
    }
    
    func registerVaccineInfo(_ postId: Int, _ images: [UIImage]) -> AnyPublisher<CertificationInfoDTO, Error> {
        moyaProvider.requestPublisher(.registerVaccineInfo(postId: postId, images: images))
            .asResult()
    }
}
