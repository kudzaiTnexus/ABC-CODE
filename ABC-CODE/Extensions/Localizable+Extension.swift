//
//  Localizable+Extension.swift
//  ABC-CODE
//
//  Created by Kudzai Mhou on 2019/03/14.
//  Copyright © 2019 Kudzai Mhou. All rights reserved.
//

import Foundation

enum StringsFile: String {
    case ReachAbilityStrings = "ReachAbilityStrings"
    case ErrorStrings = "ErrorStrings"
    case EnvironmentStrings = "EnvironmentStrings"
}

extension Localizable {
    
    func localized(in file: StringsFile) -> String {
        return localized(in: file.rawValue,
                         bundle: Self.defaultBundle)
    }
    
}
