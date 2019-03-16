//
//  LoadCountriesDataTaskFactory.swift
//  ABC-CODE
//
//  Created by Kudzai Mhou on 2019/03/16.
//  Copyright © 2019 Kudzai Mhou. All rights reserved.
//

import Foundation

protocol LoadCountriesDataTaskFactory {
    func createTask(continent: String, callbacks: LoadCountriesTaskCallbacks) -> AsyncTask
}

class LoadCountriesDataTaskFactoryImplementation: LoadCountriesDataTaskFactory {
    
    func createTask(continent: String, callbacks: LoadCountriesTaskCallbacks) -> AsyncTask {
        return LoadCountriesTask(continent: continent, callbacks: callbacks)
    }
}
