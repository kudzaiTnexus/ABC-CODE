//
//  ContinentCountriesViewModelFactory.swift
//  ABC-CODE
//
//  Created by Kudzai Mhou on 2019/03/16.
//  Copyright © 2019 Kudzai Mhou. All rights reserved.
//

import Foundation

protocol ContinentCountriesViewModelFactory {
    func createViewModel(view: ViewCountriesView, continent: String) -> ContinentCountriesViewModel
}

class ContinentCountriesViewModelFactoryImplementation: ContinentCountriesViewModelFactory {
    
    func createViewModel(view: ViewCountriesView, continent: String) -> ContinentCountriesViewModel {
        return ContinentCountriesViewModelImplementation(view: view, continent: continent)
    }
}
