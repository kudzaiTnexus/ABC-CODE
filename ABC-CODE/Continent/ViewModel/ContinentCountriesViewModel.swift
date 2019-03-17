//
//  ContinentCountriesViewModel.swift
//  ABC-CODE
//
//  Created by Kudzai Mhou on 2019/03/13.
//  Copyright © 2019 Kudzai Mhou. All rights reserved.
//

import Foundation

protocol ContinentCountriesViewModel {
    func viewWillAppear()
    func tryAgainTapped()
    func showCountryDetailedInfo(country: CountryData)
}

class ContinentCountriesViewModelImplementation: ContinentCountriesViewModel {
    
    private weak var view: ViewCountriesView?
    private var countriesByContinent: ContinentData?
    private let modelMapping = Resolver.resolve(dependency: CountryDataMapping.self)
    private let flowController = Resolver.resolve(dependency: FlowViewController.self)
    private let continent: String
    private let taskFactory: LoadCountriesDataTaskFactory
    
    private lazy var asyncTask: AsyncTask = {
        return taskFactory.createTask(continent: continent, callbacks: self)
    }()
    
    init(view: ViewCountriesView, continent: String, taskFactory: LoadCountriesDataTaskFactory = LoadCountriesDataTaskFactoryImplementation()) {
        self.view = view
        self.continent = continent
        self.taskFactory = taskFactory
    }
    
    func viewWillAppear() {
        asyncTask.execute()
    }
    
    func tryAgainTapped() {
        view?.hideErrorView()
        asyncTask.execute()
    }
    
    func showCountryDetailedInfo(country: CountryData) {
        let countryDetailsViewController = CountryViewController(countryDetails: country)
        flowController.pushToNavigationStack(viewController: countryDetailsViewController)
    }
    
}

extension ContinentCountriesViewModelImplementation: LoadCountriesTaskCallbacks {
    
    func asyncTaskDidStart() {
        view?.showProgressView()
    }
    
    func asyncTaskDidFinish(withCountries countriesData: ContinentData?) {
        guard let view = view else {
            return
        }
        
        view.hideProgressView()
        
        if let countriesData = countriesData {
            if countriesData.isEmpty {
                view.showEmptyState()
            } else {
                let data = modelMapping.internalModelMapping(continentData: countriesData)
                view.showCountries(continentData: data)
            }
        } else {
            showErrorView()
        }
    }
    
    func asyncTaskDidFinish(withError error: NSError) {
        showErrorView()
    }
    
    fileprivate func showErrorView() {
        guard let view = view else {
            return
        }
        
        view.hideProgressView()
        view.showErrorView()
    }
}
