//
//  HomeViewModel.swift
//  Ddungja
//
//  Created by 오승기 on 2023/08/01.
//

import SwiftUI
import Combine

final class HomeViewModel: ObservableObject {
    private let coordinator: CoordinatorProtocol
    private let homeUsecase: HomeUsecaseInterface
    private var cancellables = Set<AnyCancellable>()
    
    @Published var info = [PostsInfoVO]()
    
    init(coordinator: CoordinatorProtocol, homeUsecase: HomeUsecaseInterface) {
        self.coordinator = coordinator
        self.homeUsecase = homeUsecase
    }
    
    func changeMonthToAge(_ month: Int) -> String {
        return month <= 12 ? "\(month)개월" : "\(month/12)년\(month%12)개월"
    }
    
    func changeGenderToImage(_ type: String) -> Image {
        return type == "MALE" ? Image("Male") : Image("Female")
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
