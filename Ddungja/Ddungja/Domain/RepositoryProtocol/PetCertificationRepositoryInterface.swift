//
//  PetCertificationRepositoyInterface.swift
//  Ddungja
//
//  Created by 오승기 on 2023/08/08.
//

import Combine
import UIKit

protocol PetCertificationRepositoryInterface {
    func getAdditionalPageInfo(_ postId: Int) -> AnyPublisher<CertificationInfoVO, CustomErrorVO>
    func registerPetNumber(_ dto: RegisterPetNumberDTO) -> AnyPublisher<RegisterPetIdVO, CustomErrorVO>
    func registerPetNumber(_ postId: Int, _ dto: RegisterPetNumberDTO) -> AnyPublisher<CertificationInfoVO, CustomErrorVO>
    func registerPetHealthInfo(_ postId: Int, _ images: [UIImage]) -> AnyPublisher<CertificationInfoVO, CustomErrorVO>
    func registerVaccineInfo(_ postId: Int, _ images: [UIImage]) -> AnyPublisher<CertificationInfoVO, CustomErrorVO>
}
