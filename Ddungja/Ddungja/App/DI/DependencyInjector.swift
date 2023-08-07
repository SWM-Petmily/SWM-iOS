//
//  DependencyInjector.swift
//  Ddungja
//
//  Created by 오승기 on 2023/07/06.
//

import Swinject

protocol DependencyAssemblable {
    func assemble(_ assemblyList: [Assembly])
    func register<T>(_ serviceType: T.Type, _ object: T)
}

public protocol DependencyResolvable {
    func resolve<T>(_ serviceType: T.Type) -> T
    func resolve<T, Arg>(_ serviceType: T.Type, argument: Arg) -> T
    func resolve<T, Arg1, Arg2>(_ serviceType: T.Type, arguments arg1: Arg1, _ arg2: Arg2) -> T
}

typealias Injector = DependencyAssemblable & DependencyResolvable

final class DependencyInjector: Injector {
    private let container: Container
    
    init(container: Container) {
        self.container = container
    }
    
    func assemble(_ assemblyList: [Assembly]) {
        assemblyList.forEach {
            $0.assemble(container: container)
        }
    }
    
    func register<T>(_ serviceType: T.Type, _ object: T) {
        container.register(serviceType) { _ in object }
    }
    
    func resolve<T>(_ serviceType: T.Type) -> T {
        return container.resolve(serviceType)!
    }
    
    func resolve<T, Arg>(_ serviceType: T.Type, argument: Arg) -> T {
        container.resolve(serviceType, argument: argument)!
    }
    func resolve<T, Arg1, Arg2>(_ serviceType: T.Type, arguments arg1: Arg1, _ arg2: Arg2) -> T {
        return container.resolve(serviceType, arguments: arg1, arg2)!
    }
}

