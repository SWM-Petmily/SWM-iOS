//
//  RegisterRepositoryInterface.swift
//  Ddungja
//
//  Created by 오승기 on 2023/08/05.
//

import Combine
import UIKit

protocol RegisterRepositoryInterface {
    func getRegisteredPet() -> AnyPublisher<[RegisteredPetVO], CustomErrorVO>
    func registerPost(_ vo: PetPostVO, _ images: [UIImage]) -> AnyPublisher<RegisterPostIDVO, CustomErrorVO>
    func deleteRegisteredInfo(_ id: Int) -> AnyPublisher<Void, CustomErrorVO>
}
