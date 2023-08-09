//
//  PetCertificationRepositoyInterface.swift
//  Ddungja
//
//  Created by 오승기 on 2023/08/08.
//

import Combine
import Moya

protocol PetCertificationRepositoryInterface {
    func getAdditionalPageInfo(_ postId: Int) -> AnyPublisher<CertificationInfoVO, MoyaError>
}
