//
//  PetCertificationRepositoyInterface.swift
//  Ddungja
//
//  Created by 오승기 on 2023/08/08.
//

import Combine
import Moya
import UIKit

protocol PetCertificationRepositoryInterface {
    func getAdditionalPageInfo(_ postId: Int) -> AnyPublisher<CertificationInfoVO, MoyaError>
    func registerPetNumber(_ postId: Int, _ dto: RegisterPetNumberDTO) -> AnyPublisher<CertificationInfoVO, MoyaError>
    func registerPetHealthInfo(_ postId: Int, _ images: [UIImage]) -> AnyPublisher<CertificationInfoVO, MoyaError>
}
