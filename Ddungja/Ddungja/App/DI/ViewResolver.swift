//
//  ViewResolver.swift
//  Ddungja
//
//  Created by 오승기 on 2023/07/06.
//

protocol ViewResolverProtocol {
    func resolveView<T>(_ serviceType: T.Type) -> T
}

final class ViewResolver: ViewResolverProtocol {
    
    private var injector: Injector
    
    init(injector: Injector) {
        self.injector = injector
    }
    
    func resolveView<T>(_ serviceType: T.Type) -> T {
        return injector.resolve(T.self)
    }
}
