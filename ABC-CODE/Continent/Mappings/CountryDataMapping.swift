//
//  CountryData.swift
//  ABC-CODE
//
//  Created by Kudzai Mhou on 2019/03/15.
//  Copyright © 2019 Kudzai Mhou. All rights reserved.
//

import Foundation

protocol CountryDataMapping {
    func internalModelMapping(continentData: [ContinentData]) -> [CountryData]
}

class CountryDataMappingImplementation: CountryDataMapping {
    func internalModelMapping(continentData: [ContinentData]) -> [CountryData] {
        return  continentData.compactMap({ $0 })
            .map{ CountryData(continentCountryInfo: $0) }
    }
}
