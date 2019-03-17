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
    var flag : String
    var subRegion : String
    var currency : [Currency]
    var language : [Language]
    var borders : [String]
    
    init(continentCountryInfo: ContinentDatum) {
        
        self.name = continentCountryInfo.name ?? ""
        self.capital = continentCountryInfo.capital ?? ""
        self.region = continentCountryInfo.region ?? ""
        self.population = continentCountryInfo.population ?? 0
        self.area = continentCountryInfo.area ?? 0
        self.flag = continentCountryInfo.flag ?? ""
        self.subRegion = continentCountryInfo.subregion ?? ""
        self.currency = continentCountryInfo.currencies ?? []
        self.language = continentCountryInfo.languages ?? []
        self.borders = continentCountryInfo.borders ?? []
    }

}
