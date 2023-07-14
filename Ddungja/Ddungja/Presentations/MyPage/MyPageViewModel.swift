//
//  MyPageViewModel.swift
//  Ddungja
//
//  Created by 오승기 on 2023/07/13.
//

import Foundation

final class MyPageViewModel: ObservableObject {
    private var coordinator: CoordinatorProtocol
    
    init(coordinator: CoordinatorProtocol) {
        self.coordinator = coordinator
    }
    
    func moveToUserProfileView() {
        coordinator.push(.userProfileView)
    }
    
    func moveToMyPostsView() {
        coordinator.push(.myPosts)
    }
}
