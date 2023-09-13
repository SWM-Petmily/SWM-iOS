//
//  MockCoordinator.swift
//  DdungjaTests
//
//  Created by 오승기 on 2023/09/13.
//

import Foundation
@testable import Ddungja

final class MockCoordinator: CoordinatorProtocol {
    func push(_ page: Ddungja.Page) {}
    func pop() {}
    func popToRoot() {}
}
