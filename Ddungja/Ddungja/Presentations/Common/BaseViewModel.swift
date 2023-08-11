//
//  BaseViewModel.swift
//  Ddungja
//
//  Created by 오승기 on 2023/08/11.
//

import SwiftUI

class BaseViewModel: ObservableObject {
    var coordinator: CoordinatorProtocol
    @Published var errorStatus = CustomErrorVO(code: 0, status: "", message: "")
    @Published var showAlert = false
    
    init(coordinator: CoordinatorProtocol) {
        self.coordinator = coordinator
    }
    
    func push(_ page: Page) {
        coordinator.push(page)
    }
    
    func pop() {
        coordinator.pop()
    }
}
