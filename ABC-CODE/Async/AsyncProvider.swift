//
//  AsyncProvider.swift
//  ABC-CODE
//
//  Created by Kudzai Mhou on 2019/03/13.
//  Copyright © 2019 Kudzai Mhou. All rights reserved.
//

import Foundation

public protocol AsyncProvider {
    func runOnConcurrentThread(_ action: @escaping () -> Void)
    func runOnMainThread(_ action: @escaping () -> Void)
}

public struct AsyncProviderImplementation: AsyncProvider {
    
    public func runOnConcurrentThread(_ action: @escaping () -> Void) {
        DispatchQueue.global(qos: .background).async(execute: action)
    }
    
    public func runOnMainThread(_ action: @escaping () -> Void) {
         DispatchQueue.main.async(execute: action)
    }
}
