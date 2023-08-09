//
//  PetCertificationRepositoy.swift
//  Ddungja
//
//  Created by 오승기 on 2023/08/09.
//

import Foundation

final class PetCertificationRepository: PetCertificationRepositoryInterface {
    private let datasource: PetCertificationDataSourceInterface
    
    init(datasource: PetCertificationDataSourceInterface) {
        self.datasource = datasource
    }
    
    func getAdditionalPageInfo(_ postId: Int) {
        datasource.getAdditionalPageInfo(postId)
    }
}
