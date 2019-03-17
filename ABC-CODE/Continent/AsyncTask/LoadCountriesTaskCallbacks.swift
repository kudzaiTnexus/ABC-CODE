//
//  AsyncTask.swift
//  ABC-CODE
//
//  Created by Kudzai Mhou on 2019/03/16.
//  Copyright © 2019 Kudzai Mhou. All rights reserved.
//

import Foundation

protocol LoadCountriesTaskCallbacks: class {
    func asyncTaskDidStart()
    func asyncTaskDidFinish(withCountries countriesData: ContinentData?)
    func asyncTaskDidFinish(withError error: NSError)
}
