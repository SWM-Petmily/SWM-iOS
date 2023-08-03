//
//  DetailPostViewModel.swift
//  Ddungja
//
//  Created by 오승기 on 2023/08/03.
//

import Foundation
import Combine
import SwiftUI

final class DetailPostViewModel: ObservableObject {
    private let coordinator: CoordinatorProtocol
    private let homeUsecase: HomeUsecaseInterface
    private var cancellables = Set<AnyCancellable>()
    
    @Published var detail: DetailPostVO?
    @Published var imagesURLString = [(id: String, url: String)]()
    @Published var diseaseInfo = [String]()
    
    init(coordinator: CoordinatorProtocol, homeUsecase: HomeUsecaseInterface) {
        self.coordinator = coordinator
        self.homeUsecase = homeUsecase
    }
    
    func getDetailPost(_ id: Int) {
        homeUsecase.getDetailPost(id)
            .sink { error in
                print("getDetailPost error \(error)")
            } receiveValue: { [weak self] vo in
                print(vo)
                self?.detail = vo
                self?.imagesURLString = vo.images.map { (id: UUID().uuidString, url: $0.url) }
                self?.diseaseInfo = vo.diseases.map { $0 }
            }
            .store(in: &cancellables)
    }
    
    func changIdToProfile(_ id: Int) -> String {
        switch id {
        case 1: return "bulldog"
        case 2: return "dog1"
        case 3: return "dog2"
        case 4: return "poodle"
        default: return "bulldog"
        }
    }
    
    func changeMonthToAge(_ month: Int) -> String {
        return month <= 12 ? "\(month)개월" : "\(month/12)년\(month%12)개월"
    }
    
    func changeGenderToImage(_ type: String) -> Image {
        return type == "MALE" ? Image("Male") : Image("Female")
    }
    
    func pop() {
        coordinator.pop()
    }
}
