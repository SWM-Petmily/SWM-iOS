//
//  RegisterRepositoryInterface.swift
//  Ddungja
//
//  Created by 오승기 on 2023/08/05.
//

import Combine
import Moya
import UIKit

protocol RegisterRepositoryInterface {
    func getRegisteredPet() -> AnyPublisher<[RegisteredPetVO], Error>
    func registerPost(_ vo: PetPostVO, _ images: [UIImage]) -> AnyPublisher<RegisterPostIDVO, Error>
}
