//
//  ContinentCountriesViewModel.swift
//  ABC-CODE
//
//  Created by Kudzai Mhou on 2019/03/13.
//  Copyright © 2019 Kudzai Mhou. All rights reserved.
//

import Foundation

protocol ContinentCountriesViewModel {
    func viewWillAppear(continent: String)
    func tryAgainTapped(continent: String)
    func requestCountriesButtonTapped(continent: String)
}

class ContinentCountriesViewModelImplementation: ContinentCountriesViewModel {
    
    private var countriesByContinent: ContinentData?
    private let repository = Resolver.resolve(dependency: ContinentCountriesRepository.self)
    
    func viewWillAppear(continent: String) {
        requestCountriesButtonTapped(continent: continent)
    }
    
    func tryAgainTapped(continent: String) {
        requestCountriesButtonTapped(continent: continent)
    }
    
    func requestCountriesButtonTapped(continent: String) {
        AsyncRunner.runOnConcurrentThread {  [weak self] in
            guard let strongSelf = self else {
                return
            }
            
            do {
                let response = try strongSelf.repository.getCountriesInformationInContinent(continent: continent)
                strongSelf.countriesByContinent = response
            } catch let error as NSError {
                print(error)
                //  strongSelf.finish(withError: error)
            }
        }
    }
    
}
