//
//  HomeViewModel.swift
//  Ddungja
//
//  Created by 오승기 on 2023/08/01.
//

import SwiftUI
import Combine

final class HomeViewModel: BaseViewModel {
    private let homeUsecase: HomeUsecaseInterface
    private var cancellables = Set<AnyCancellable>()
    @State private var isLoading = false
    
    @Published var info = [PostsInfoVO]()
    @Published var pageInfo = 0
    @Published var totalPage = 0
    
    var fetchMoreActionSubject = PassthroughSubject<(), Never>()
    
    struct LikeButton {
        let imageName: String
        let color: Color
    }
    
    init(coordinator: CoordinatorProtocol, homeUsecase: HomeUsecaseInterface) {
        self.homeUsecase = homeUsecase
        
        super.init(coordinator: coordinator)
        
        fetchMoreActionSubject.sink { [weak self] _ in
            guard let self = self else { return }
            if !self.isLoading {
                self.fetchMoreHomePosts()
            }
        }
        .store(in: &cancellables)
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
                self?.totalPage = vo.totalPages
            }
            .store(in: &cancellables)
    }
    
    func tappedLike(_ postId: Int, _ currentCheck: Bool) {
        GoogleAnalyticsUtil.shared.logScreenEvent("TappedLike", parameters: ["postId": postId])
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
    
    private func fetchMoreHomePosts() {
        GoogleAnalyticsUtil.shared.logScreenEvent("fetchMoreHomePosts", parameters: ["Request_Page": pageInfo + 1])
        if(pageInfo == totalPage) { return }
        let next = pageInfo + 1
        homeUsecase.getMainPost(next)
            .sink { [weak self] _ in
                self?.isLoading = false
            } receiveValue: { [weak self] vo in
                self?.info += vo.postsInfo
                self?.pageInfo = next
            }
            .store(in: &cancellables)
    }
}
