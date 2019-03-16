//
//  ContinentCountriesRepository.swift
//  ABC-CODE
//
//  Created by Kudzai Mhou on 2019/03/13.
//  Copyright © 2019 Kudzai Mhou. All rights reserved.
//

import Foundation

protocol ContinentCountriesRepository {
    func getCountriesInformationInContinent(continent: String) throws -> [ContinentData]?
}

class ContinentCountriesRepositoryImplementation: ContinentCountriesRepository {
    
    private let serviceClient = Resolver.resolve(dependency: ContinentInfoService.self)
    private let cache = Resolver.resolve(dependency: ContinentCountriesCache.self)
    private static let getCountriesInfoLock = NSLock()
    private var response: [ContinentData]?
    private let error = NSError()
    
    func getCountriesInformationInContinent(continent: String) throws -> [ContinentData]? {
        
        ContinentCountriesRepositoryImplementation.getCountriesInfoLock.lock()
        
        defer {
            ContinentCountriesRepositoryImplementation.getCountriesInfoLock.unlock()
        }
        
        if let cachedCountriesInformation = cache.getValue(forKey: continent) {
            return cachedCountriesInformation
        }
        
        let requestParam = ContinentRequestParameter.init(selectedContinent: continent)
        serviceClient.getContinentCountriesData(continentRequest: requestParam, completion: { (data, error) in
            self.response = data
        })
        
        guard let response = response else {
           return nil
        }
        
        cache.put(value: response, forKey: continent)
        return response
    }
    
}
