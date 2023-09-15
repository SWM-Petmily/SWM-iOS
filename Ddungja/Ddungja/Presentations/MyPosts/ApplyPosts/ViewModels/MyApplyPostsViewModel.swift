//
//  MyApplyPostsViewModel.swift
//  Ddungja
//
//  Created by 오승기 on 2023/07/18.
//

import Combine
import SwiftUI

final class MyApplyPostsViewModel: BaseViewModel {
    private let myPostsUsecase: MyApplyPostsUsecaseInterface
    let applyViewModel: ApplyCommonViewModel
    private var cancellables = Set<AnyCancellable>()
    @State private var isLoading = false
    
    @Published var pageInfo = 0
    @Published var totalPage = 0
    @Published var status = ""
    @Published var myApplyPosts = [ApplyPostsInfoVO]()
    
    private var isRequest = false
    
    var deleteEvent = PassthroughSubject<Int, Never>()
    
    init(coordinator: CoordinatorProtocol, myPostsUsecase: MyApplyPostsUsecaseInterface, applyViewModel: ApplyCommonViewModel) {
        self.myPostsUsecase = myPostsUsecase
        self.applyViewModel = applyViewModel
        
        super.init(coordinator: coordinator)
        
        deleteEvent
            .throttle(for: 3, scheduler: RunLoop.main, latest: false)
            .sink{ [weak self] id in
                guard let self = self else { return }

                if(!self.isRequest) {
                    self.isRequest = true
                    self.deletInfo(id: id)
                }
            }
            .store(in: &cancellables)
    }
    
    func getMyApplyPosts(_ status: String, _ page: Int = 1) {
        myPostsUsecase.getMyApplyPosts(status, page)
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
                self?.myApplyPosts = vo.content
                self?.pageInfo = vo.pageable.pageNumber + 1
                self?.totalPage = vo.totalPage
            }
            .store(in: &cancellables)
    }
    
    func fetchMoreMyApplyPosts() {
        if(pageInfo == totalPage) { return }
        let next = pageInfo + 1
        myPostsUsecase.getMyApplyPosts(status, next)
            .sink { completion in
                print(completion)
                self.isLoading = false
            } receiveValue: { [weak self] vo in
                self?.myApplyPosts += vo.content
                self?.pageInfo = vo.pageable.pageNumber + 1
                self?.totalPage = vo.totalPage
            }
            .store(in: &cancellables)
    }
    
    private func deletInfo(id: Int) {
        myPostsUsecase.deleteInfo(id: id)
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
                    self.isRequest = false
                }
            } receiveValue: { [weak self] vo in
                self?.pop()
                print(vo)
            }
            .store(in: &cancellables)
    }
}
