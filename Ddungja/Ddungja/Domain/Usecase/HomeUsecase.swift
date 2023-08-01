//
//  HomeUsecase.swift
//  Ddungja
//
//  Created by 오승기 on 2023/08/01.
//

import Foundation

protocol HomeUsecaseInterface {
    func getMainPost()
}

final class HomeUsecase: HomeUsecaseInterface {
    private let repository: HomeRepositoryInterface
    
    init(repository: HomeRepositoryInterface) {
        self.repository = repository
    }
    
    func getMainPost() {
        repository.getMainPost()
    }
}
