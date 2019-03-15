//
//  DependencyInjectionContainer.swift
//  ABC-CODE
//
//  Created by Kudzai Mhou on 2019/03/13.
//  Copyright © 2019 Kudzai Mhou. All rights reserved.
//

import Foundation
//import Swinject
//
//class DependencyInjectionContainer {
//
//    public static let instance = DependencyInjectionContainer()
//    fileprivate let container = Container()
//    fileprivate var pluginRegistry = [String: [() -> Any]]()
//}
//
//extension DependencyInjectionContainer : Registrable {
//
//    public func register<T>(depedency: T.Type, implemenation: @escaping () -> T, objectScope: ObjectScope = .graph) {
//        container.register(depedency, factory: { _ in implemenation() }).inObjectScope(objectScope)
//    }
//
//    public func registerSingleton<T>( _ serviceType: T.Type, creationMethod: @escaping () -> T) {
//        register(depedency: serviceType, implemenation: creationMethod, objectScope: .container)
//    }
//
//    public func register<Plugin>(plugin: Plugin.Type, with implementation: @escaping () -> Plugin) {
//        let key = String(describing: plugin)
//        let plugins = pluginRegistry[key] ?? []
//        pluginRegistry[key] = plugins + [implementation]
//    }
//}
//
//extension DependencyInjectionContainer : Resolvable {
//
//    public func resolve<T>(_ dependency: T.Type) -> T {
//        guard let implementation = container.resolve(dependency) else {
//            fatalError("Unable to Resolve")
//        }
//        return implementation
//    }
//
//    public func reset() {
//        container.removeAll()
//    }
//}

import Swinject

class DependencyInjectionContainer {
    
    private let container = Container()
    public static let instance = DependencyInjectionContainer()
}

extension DependencyInjectionContainer : Registrable {
    
    public func register<T>(depedency: T.Type, implemenation: @escaping () -> T, objectScope: ObjectScope = .graph) {
        container.register(depedency, factory: { _ in implemenation() }).inObjectScope(objectScope)
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
