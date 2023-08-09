//
//  PetCertificationUsecaseInterface.swift
//  Ddungja
//
//  Created by 오승기 on 2023/08/08.
//

import Combine
import Moya

protocol PetCertificationUsecaseInterface {
    func getAdditionalPageInfo(_ postId: Int) -> AnyPublisher<CertificationInfoVO, MoyaError>
}

final class PetCertificationUsecase: PetCertificationUsecaseInterface {
    private let repository: PetCertificationRepositoryInterface
    
    init(repository: PetCertificationRepositoryInterface) {
        self.repository = repository
    }
    
    func getAdditionalPageInfo(_ postId: Int) -> AnyPublisher<CertificationInfoVO, MoyaError> {
        return repository.getAdditionalPageInfo(postId)
    }
}
