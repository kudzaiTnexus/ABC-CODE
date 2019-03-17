//
//  Double+Extension.swift
//  ABC-CODE
//
//  Created by Kudzai Mhou on 2019/03/17.
//  Copyright © 2019 Kudzai Mhou. All rights reserved.
//

import Foundation

extension Double {
    mutating func roundToPlaces(places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return Darwin.round(self * divisor) / divisor
    }
}
