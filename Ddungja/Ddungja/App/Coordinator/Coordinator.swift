//
//  Coordinator.swift
//  Ddungja
//
//  Created by 오승기 on 2023/07/13.
//

import Combine
import SwiftUI

protocol CoordinatorProtocol {
    var pathPublisher: Published<NavigationPath>.Publisher { get }
    
    func push(_ page: Page)
    func pop()
    func popToRoot()
}

final class Coordinator: ObservableObject, CoordinatorProtocol {
    @Published var path = NavigationPath()
    var pathPublisher: Published<NavigationPath>.Publisher { $path }
    static let instance = Coordinator()
    
    init() {}
    
    func push(_ page: Page) {
        path.append(page)
    }
    
    func pop() {
        path.removeLast()
    }
    
    func popToRoot() {
        path.removeLast(path.count)
    }
}
