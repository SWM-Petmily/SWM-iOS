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
    
    struct LikeButton {
        let imageName: String
        let color: Color
    }
    
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
            }
            .store(in: &cancellables)
    }
    
    func tappedLike(_ postId: Int, _ currentCheck: Bool) {
        homeUsecase.tappedLike(postId, currentCheck)
            .sink { error in
                
            } receiveValue: { [weak self] vo in
                guard let self = self else { return }
                self.info = self.info.map { var mutableVO = $0
                    if mutableVO.id == postId {
                        mutableVO.isLike = !currentCheck
                    }
                    return mutableVO
                }
            }
            .store(in: &cancellables)
    }
    
    func likeButton(_ state: Bool) -> LikeButton {
        let imageName = state ? "heart.fill" : "heart"
        let color = state ? Color.main : Color.white
        return LikeButton(imageName: imageName, color: color)
    }
    
    func pushDetailPost(_ id: Int) {
        coordinator.push(.detailPost(id: id))
    }
}
