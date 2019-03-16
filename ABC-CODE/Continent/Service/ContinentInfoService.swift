//
//  ContinentInfoService.swift
//  ABC-CODE
//
//  Created by Kudzai Mhou on 2019/03/13.
//  Copyright © 2019 Kudzai Mhou. All rights reserved.
//

import Foundation
import Swinject

protocol ContinentInfoService {
    func getContinentCountriesData(continentRequest: ContinentRequestParameter, completion: @escaping (_ continentInfo: [ContinentData]?, _ error: Error?) -> Void)
}

class ContinentInfoServiceImplementantion: ContinentInfoService {
    
    private let continentDataBaseURL = "https://restcountries.eu/rest/v2/region/"
    private let service = Resolver.resolve(dependency: ServiceClient.self)
    
    func getContinentCountriesData(continentRequest: ContinentRequestParameter, completion: @escaping (_ continentInfo: [ContinentData]?, _ error: Error?) -> Void) {
        
        let continentsDataUrl = continentDataBaseURL + continentRequest.continent
        
        service.getJSONFromURL(urlString: continentsDataUrl) { (data, error) in
            guard let data = data, error == nil else {
                return completion(nil, error)
            }
            self.createContinentObjectWith(json: data, completion: { (continentInfo, error) in
                return completion(continentInfo, nil)
            })
        }
    }
    
    private func createContinentObjectWith(json: Data, completion: @escaping (_ data: [ContinentData]?, _ error: Error?) -> Void) {
        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let continent = try decoder.decode([ContinentData].self, from: json)
            return completion(continent, nil)
        } catch let error {
            return completion(nil, error)
        }
    }
}

