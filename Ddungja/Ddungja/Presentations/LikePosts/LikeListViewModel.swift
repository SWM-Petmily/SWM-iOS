//
//  LikeListViewModel.swift
//  Ddungja
//
//  Created by 오승기 on 2023/08/18.
//

import Combine
import SwiftUI

enum LikeListButtonState: String {
    case all = ""
    case save = "SAVE"
    case waiting = "WAITING"
    case complete = "COMPLETE"
    case delete = "DELETE"
}

final class LikeListViewModel: BaseViewModel {
    private let likeListUsecase: LikeListUsecaseInterface
    private var cancellables = Set<AnyCancellable>()
    
    @Published var likeList = [LikeListInfoVO]()
    @Published var pageInfo = 0
    @Published var totalPage = 0
    @Published var status = ""
    @State private var isLoading = false
    
    var fetchMoreActionSubject = PassthroughSubject<(), Never>()
    
    init(coordinator: CoordinatorProtocol, likeListUsecase: LikeListUsecaseInterface) {
        self.likeListUsecase = likeListUsecase
        
        super.init(coordinator: coordinator)
        
        fetchMoreActionSubject.sink { [weak self] _ in
            guard let self = self else { return }
            if !self.isLoading {
                self.fetchMoreLikeList()
            }
        }
        .store(in: &cancellables)
    }
    
    func getLikeList(_ page: Int = 1) {
        likeListUsecase.getLikeList(status, page)
            .sink { [weak self] completion in
                guard let self = self else { return }
                switch completion {
                case .finished:
                    break
                case let .failure(error):
                    self.showAlert = true
                    self.errorTitle = error.title
                    self.errorDetailMessage = error.detailMessage
                    self.errorIcon = error.icon
                    self.errorIconColor = error.iconColor
                }
            } receiveValue: { [weak self] vo in
                guard let self = self else { return }
                self.likeList = vo.content
                self.pageInfo = vo.pageable.pageNumber + 1
                self.totalPage = vo.totalPages
            }
            .store(in: &cancellables)
    }
    
    func fetchMoreLikeList() {
        if(pageInfo == totalPage) { return }
        let next = pageInfo + 1
        likeListUsecase.getLikeList(status, next)
            .sink { completion in
                print("getLikeList \(completion)")
            } receiveValue: { [weak self] vo in
                guard let self = self else { return }
                self.likeList += vo.content
                self.pageInfo = vo.pageable.pageNumber + 1
                self.totalPage = vo.totalPages
            }
            .store(in: &cancellables)
    }
}
