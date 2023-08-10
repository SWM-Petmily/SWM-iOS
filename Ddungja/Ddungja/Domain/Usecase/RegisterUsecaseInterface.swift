//
//  RegisterUsecaseInterface.swift
//  Ddungja
//
//  Created by 오승기 on 2023/08/05.
//

import Combine
import Moya
import UIKit

protocol RegisterUsecaseInterface {
    func getRegisteredPet() -> AnyPublisher<[RegisteredPetVO], Error>
    func registerPost(_ vo: PetPostVO, _ images: [Data]) -> AnyPublisher<RegisterPostIDVO, Error>
}

final class RegisterUsecase: RegisterUsecaseInterface {
    private let repository: RegisterRepositoryInterface
    
    init(repository: RegisterRepositoryInterface) {
        self.repository = repository
    }
    
    func getRegisteredPet() -> AnyPublisher<[RegisteredPetVO], Error> {
        return repository.getRegisteredPet()
    }
    
    func registerPost(_ vo: PetPostVO, _ images: [Data]) -> AnyPublisher<RegisterPostIDVO, Error> {
        var userImages = [UIImage]()
        for image in images {
            if let uiImage = UIImage(data: image) {
                userImages.append(uiImage)
            }
        }
        
        return repository.registerPost(vo, userImages)
    }
}
