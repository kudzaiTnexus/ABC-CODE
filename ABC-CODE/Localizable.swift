//
//  Localizable.swift
//  ABC-CODE
//
//  Created by Kudzai Mhou on 2019/03/14.
//  Copyright © 2019 Kudzai Mhou. All rights reserved.
//

import Foundation

public protocol Localizable {
    static var defaultBundle: Bundle { get}
    func localized(in table: String, bundle : Bundle) -> String
}

extension String: Localizable {
    
    public static var defaultBundle: Bundle {
        get {
            return  Bundle.main
        }
    }
    
    public func localized(in table: String, bundle : Bundle = defaultBundle) -> String {
        return NSLocalizedString(self,
                                 tableName: table,
                                 bundle: bundle,
                                 value: "",
                                 comment: "")
    }
}
