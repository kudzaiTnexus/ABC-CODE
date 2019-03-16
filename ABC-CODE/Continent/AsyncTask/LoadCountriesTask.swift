//
//  LoadCountriesTask.swift
//  ABC-CODE
//
//  Created by Kudzai Mhou on 2019/03/16.
//  Copyright © 2019 Kudzai Mhou. All rights reserved.
//

import Foundation

class LoadCountriesTask: AsyncTask {
    
    private let continent: String
    private weak var callbacks: LoadCountriesTaskCallbacks?
    private let repository = Resolver.resolve(dependency: ContinentCountriesRepository.self)
    
    init(continent: String, callbacks: LoadCountriesTaskCallbacks) {
        self.continent = continent
        self.callbacks = callbacks
    }
    
    func execute() {
        callbacks?.asyncTaskDidStart()
        AsyncRunner.runOnConcurrentThread  { [weak self] in
            guard let strongSelf = self else {
                return
            }
            sleep(3)
            do {
                let response = try strongSelf.repository.getCountriesInformationInContinent(continent: strongSelf.continent)
                strongSelf.finish(withCountries: response)
            } catch let error as NSError {
                strongSelf.finish(withError: error)
            }
        }
    }
    
    private func finish(withCountries countriesData: [ContinentData]?) {
        AsyncRunner.runOnMainThread { [weak self] in
            self?.callbacks?.asyncTaskDidFinish(withCountries: countriesData)
        }
    }
    
    private func finish(withError error: NSError) {
        AsyncRunner.runOnMainThread { [weak self] in
            self?.callbacks?.asyncTaskDidFinish(withError: error)
        }
    }
 
}
