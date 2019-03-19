//
//  DependencyInjectionContainer.swift
//  ABC-CODE
//
//  Created by Kudzai Mhou on 2019/03/13.
//  Copyright © 2019 Kudzai Mhou. All rights reserved.
//

import Foundation
import Swinject

class DependencyInjectionContainer {
    
    private let container = Container()
    public static let instance = DependencyInjectionContainer()
}

extension DependencyInjectionContainer : Registrable {
    
    public func register<T>(depedency: T.Type, implemenation: @escaping () -> T) {
        container.register(depedency, factory: { _ in implemenation() }).inObjectScope(.graph)
    }
    
    public func registerSingleton<T>(depedency: T.Type, implemenation: @escaping () -> T) {
        container.register(depedency, factory: { _ in implemenation() }).inObjectScope(.container)
    }

}

extension DependencyInjectionContainer : Resolvable {
    
    public func resolve<T>(_ dependency: T.Type) -> T {
        guard let implementation = container.resolve(dependency) else {
            fatalError("Unable to Resolve Dependency")
        }
        return implementation
    }
    
    public func reset() {
        container.removeAll()
    }
}
