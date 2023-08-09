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
    func getAdditionalPageInfo(_ postId: Int) -> AnyPublisher<CertificationInfoDTO, MoyaError>
    func registerPetNumber(_ postId: Int, _ dto: RegisterPetNumberDTO) -> AnyPublisher<CertificationInfoDTO, MoyaError>
    func registerPetHealthInfo(_ postId: Int, _ images: [UIImage]) -> AnyPublisher<CertificationInfoDTO, MoyaError>
}

final class CertificationAPIProvider: PetCertificationDataSourceInterface {
    private let moyaProvider: MoyaProvider<CertificationAPI>
    
    init(moyaProvider: MoyaProvider<CertificationAPI> = .init()) {
        self.moyaProvider = moyaProvider
    }
    
    func getAdditionalPageInfo(_ postId: Int) -> AnyPublisher<CertificationInfoDTO, MoyaError> {
        moyaProvider.requestPublisher(.getAdditionalPage(postId: 401))
            .retry(3)
            .eraseToAnyPublisher()
            .map(CertificationInfoDTO.self)
    }
    
    func registerPetNumber(_ postId: Int, _ dto: RegisterPetNumberDTO) -> AnyPublisher<CertificationInfoDTO, MoyaError>  {
        moyaProvider.requestPublisher(.registerPetNumber(postId: postId, dto: dto))
            .retry(3)
            .eraseToAnyPublisher()
            .map(CertificationInfoDTO.self)
    }
    
    func registerPetHealthInfo(_ postId: Int, _ images: [UIImage]) -> AnyPublisher<CertificationInfoDTO, MoyaError> {
        moyaProvider.requestPublisher(.registerHealthInfo(postId: postId, images: images))
            .retry(3)
            .eraseToAnyPublisher()
            .map(CertificationInfoDTO.self)
    }
}
