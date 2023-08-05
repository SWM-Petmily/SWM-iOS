//
//  RegisterRepository.swift
//  Ddungja
//
//  Created by 오승기 on 2023/08/05.
//

import Foundation

final class RegisterRepository: RegisterRepositoryInterface {
    private let datasource: RegisterDataSourceInterface
    
    init(datasource: RegisterDataSourceInterface) {
        self.datasource = datasource
    }
}
