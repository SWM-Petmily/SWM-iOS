//
//  HomeRepository.swift
//  Ddungja
//
//  Created by 오승기 on 2023/08/01.
//

import Foundation

final class HomeRepository: HomeRepositoryInterface {
    private let datasource: HomeDataSourceInterface
    
    init(datasource: HomeDataSourceInterface) {
        self.datasource = datasource
    }
    
    func getMainPost() {
        datasource.getMainPost()
    }
}
