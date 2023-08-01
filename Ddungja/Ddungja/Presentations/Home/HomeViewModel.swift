//
//  HomeViewModel.swift
//  Ddungja
//
//  Created by 오승기 on 2023/08/01.
//

import Foundation
import Combine

final class HomeViewModel: ObservableObject {
    private let coordinator: CoordinatorProtocol
    private let homeUsecase: HomeUsecaseInterface
    private var cancellables = Set<AnyCancellable>()
    
    @Published var info = [PostsInfoVO]()
    
    init(coordinator: CoordinatorProtocol, homeUsecase: HomeUsecaseInterface) {
        self.coordinator = coordinator
        self.homeUsecase = homeUsecase
        
        getMainPost()
    }
    
    func getMainPost(_ page: Int = 1) {
        homeUsecase.getMainPost(page)
            .sink { error in
                print("HomeViewModel getMainPost error = \(error)")
            } receiveValue: { [weak self] vo in
                print(vo)
                self?.info = vo.postsInfo
                
//                self?.info = vo
            }
            .store(in: &cancellables
            )
    }
}
