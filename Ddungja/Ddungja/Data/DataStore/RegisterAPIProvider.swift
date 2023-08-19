//
//  RegisterAPIProvider.swift
//  Ddungja
//
//  Created by 오승기 on 2023/08/05.
//

import Moya
import CombineMoya
import Combine
import UIKit

protocol RegisterDataSourceInterface {
    func getRegisteredPet() -> AnyPublisher<RegisteredPetDTO, CustomErrorVO>
    func registerPost(_ vo: PetPostVO, _ images: [UIImage]) -> AnyPublisher<RegisterPostDTO, CustomErrorVO>
    func deleteRegisteredInfo(_ id: Int) -> AnyPublisher<Void, CustomErrorVO>
}

final class RegisterAPIProvider: RegisterDataSourceInterface {
    private let moyaProvider: MoyaProvider<RegisterAPI>
    
    init(moyaProvider: MoyaProvider<RegisterAPI> = .init()) {
        self.moyaProvider = moyaProvider
    }
    
    func getRegisteredPet() -> AnyPublisher<RegisteredPetDTO, CustomErrorVO> {
        return moyaProvider.requestPublisher(.getRegiteredPet)
            .asResult()
    }
    
    func registerPost(_ vo: PetPostVO, _ images: [UIImage]) -> AnyPublisher<RegisterPostDTO, CustomErrorVO> {
        moyaProvider.requestPublisher(.registerPost(vo: vo, images: images))
            .asResult()
    }
    
    func deleteRegisteredInfo(_ id: Int) -> AnyPublisher<Void, CustomErrorVO> {
        moyaProvider.requestPublisher(.deleteRegisteredInfo(id: id))
            .asResult()
    }
}
