//
//  ViewCountriesView.swift
//  ABC-CODE
//
//  Created by Kudzai Mhou on 2019/03/16.
//  Copyright © 2019 Kudzai Mhou. All rights reserved.
//

import Foundation

protocol ViewCountriesView: class, ProgressView, ErrorView {
    func showEmptyState()
    func showCountries(continentData: [CountryData])
}
