//
//  AppDependencies.swift
//  ABC-CODE
//
//  Created by Kudzai Mhou on 2019/03/13.
//  Copyright © 2019 Kudzai Mhou. All rights reserved.
//

import Foundation

class AppDependencies {
    
    static func registerAllApplicationDependencies() {
        let container = DependencyInjectionContainer.instance
        container.register(depedency: ServiceClient.self, implemenation: { ServiceClientImplementation() })
        container.register(depedency: ContinentInfoService.self, implemenation: { ContinentInfoServiceImplementantion() })
        container.register(depedency: AsyncProvider.self, implemenation: { AsyncProviderImplementation() })
        container.register(depedency: ContinentCountriesRepository.self, implemenation: { ContinentCountriesRepositoryImplementation() })
        //container.registerSingleton(ContinentCountriesCache.self) { ContinentCountriesCacheImplementation()}
        container.register(depedency: ContinentCountriesCache.self, implemenation: { ContinentCountriesCacheImplementation() })
    }
}

