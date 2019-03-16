//
//  ErrorViewControllerFactory.swift
//  ABC-CODE
//
//  Created by Kudzai Mhou on 2019/03/15.
//  Copyright © 2019 Kudzai Mhou. All rights reserved.
//

import Foundation

protocol ErrorViewControllerFactory {
    func createViewController(onTryAgain: @escaping () -> Void) -> ErrorViewController
}

class ErrorViewControllerFactoryImplementation: ErrorViewControllerFactory {
    
    func createViewController(onTryAgain: @escaping () -> Void) -> ErrorViewController {
        return ErrorViewControllerImplementation(onTryAgain: onTryAgain)
    }
    
}
