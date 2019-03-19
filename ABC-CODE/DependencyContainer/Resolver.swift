//
//  Resolver.swift
//  ABC-CODE
//
//  Created by Kudzai Mhou on 2019/03/13.
//  Copyright © 2019 Kudzai Mhou. All rights reserved.
//

import Foundation
import Swinject

public protocol Resolvable {
    func resolve<T>(_ dependency: T.Type) -> T
    func reset()
}

public protocol Registrable {
    func register<T>(depedency: T.Type, implemenation: @escaping () -> T)
    func registerSingleton<T>(depedency: T.Type, implemenation: @escaping () -> T)
}

public protocol Resolving {
    static func resolve<T>( dependency: T.Type) -> T
    static func reset()
}

class Resolver {
    private static var container: Resolvable = DependencyInjectionContainer.instance
}

extension Resolver : Resolving {
    
    public static func resolve<T>(dependency: T.Type) -> T {
        return container.resolve(dependency)
    }
    public static func reset() {
        container.reset()
    }
}
