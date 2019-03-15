//
//  CountryData.swift
//  ABC-CODE
//
//  Created by Kudzai Mhou on 2019/03/15.
//  Copyright © 2019 Kudzai Mhou. All rights reserved.
//

import Foundation

struct CountryData {
    var name : String
    var capital : String
    var region : String
    var population : Int
    var area : Int
    
    init(continentCountryInfo: ContinentData) {
        self.name = continentCountryInfo.name ?? ""
        self.capital = continentCountryInfo.capital ?? ""
        self.region = continentCountryInfo.region ?? ""
        self.population = continentCountryInfo.population ?? 0
        self.area = continentCountryInfo.area ?? 0
    }

}
