//
//  AsyncTaskCallbacks.swift
//  ABC-CODE
//
//  Created by Kudzai Mhou on 2019/03/16.
//  Copyright © 2019 Kudzai Mhou. All rights reserved.
//

import Foundation

protocol AsyncTaskCallbacks: class {
    func taskDidStart()
    func taskDidFinish(withError error: NSError)
}
