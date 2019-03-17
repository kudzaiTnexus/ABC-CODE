//
//  MockData.swift
//  ABC-CODE
//
//  Created by Kudzai Mhou on 2019/03/17.
//  Copyright © 2019 Kudzai Mhou. All rights reserved.
//

import Foundation

class MockData {
    var countries: ContinentData
    
    init() {
        self.countries = try! JSONDecoder().decode(ContinentData.self, from: Data(contentsOf: Bundle.main.url(forResource: "data", withExtension: "json")!))
    }
}
