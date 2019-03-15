//
//  ContinentRequestParameter.swift
//  ABC-CODE
//
//  Created by Kudzai Mhou on 2019/03/13.
//  Copyright © 2019 Kudzai Mhou. All rights reserved.
//

import Foundation

struct ContinentRequestParameter: Codable {
    var continent: String

    init(selectedContinent: String) {
        self.continent = selectedContinent
    }
}
