//
//  AppEnvironment.swift
//  ABC-CODE
//
//  Created by Kudzai Mhou on 2019/03/17.
//  Copyright © 2019 Kudzai Mhou. All rights reserved.
//

import Foundation

class AppEnvironment {
    static let sharedInstance = AppEnvironment()
    var devEnv = false
    private init() {}
}
