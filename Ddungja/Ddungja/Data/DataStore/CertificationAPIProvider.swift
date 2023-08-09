//
//  CertificationAPIProvider.swift
//  Ddungja
//
//  Created by 오승기 on 2023/08/09.
//

import Foundation
import CombineMoya
import Moya
import Combine
protocol PetCertificationDataSourceInterface {
    func getAdditionalPageInfo(_ postId: Int)
}

final class CertificationAPIProvider: PetCertificationDataSourceInterface {
    private let moyaProvider: MoyaProvider<CertificationAPI>
    var cancel = Set<AnyCancellable>()
    init(moyaProvider: MoyaProvider<CertificationAPI> = .init()) {
        self.moyaProvider = moyaProvider
    }
    
    func getAdditionalPageInfo(_ postId: Int) {
        moyaProvider.requestPublisher(.getAdditionalPage(postId: 599))
            .retry(3)
            .eraseToAnyPublisher()
            .sink { error in
                print(error)
            } receiveValue: { response in
                print("response \(response.statusCode)")
                print(response)
            }
            .store(in: &cancel)
    }
}
