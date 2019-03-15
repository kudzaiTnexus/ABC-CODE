//
//  AsyncRunner.swift
//  ABC-CODE
//
//  Created by Kudzai Mhou on 2019/03/13.
//  Copyright © 2019 Kudzai Mhou. All rights reserved.
//

import Foundation

public struct AsyncRunner {
    
    private static let threadRunner = Resolver.resolve(dependency: AsyncProvider.self)
    
    public static func runOnConcurrentThread(_ action: @escaping () -> Void) {
        threadRunner.runOnConcurrentThread(action)
    }
    
    public static func runOnMainThread(_ action: @escaping () -> Void) {
        threadRunner.runOnMainThread(action)
    }
}
