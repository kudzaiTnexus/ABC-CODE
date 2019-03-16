//
//  ContinentCountriesCache.swift
//  ABC-CODE
//
//  Created by Kudzai Mhou on 2019/03/13.
//  Copyright © 2019 Kudzai Mhou. All rights reserved.
//

import Foundation

protocol ContinentCountriesCache {
    func getValue(forKey: String) -> [ContinentData]?
    func put(value: [ContinentData]?, forKey: String)
    func removeValue(forKey: String)
}

class ContinentCountriesCacheImplementation: ContinentCountriesCache {
    
    private var cache: [String: [ContinentData]] = [:]
    
    func getValue(forKey: String) -> [ContinentData]? {
        return cache[forKey]
    }
    
    func put(value: [ContinentData]?, forKey: String) {
        cache[forKey] = value
    }
    
    func removeValue(forKey: String) {
        cache[forKey] = nil
    }
    
}
