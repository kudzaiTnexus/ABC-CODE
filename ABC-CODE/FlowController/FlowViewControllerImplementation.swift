//
//  FlowViewController.swift
//  ABC-CODE
//
//  Created by Kudzai Mhou on 2019/03/17.
//  Copyright © 2019 Kudzai Mhou. All rights reserved.
//

import UIKit

protocol FlowViewController {
    func pushToNavigationStack(viewController: UIViewController)
    func getNavigationController() -> UINavigationController
}

class FlowViewControllerImplementation: FlowViewController {
    
    let navigationController = UINavigationController()

    func pushToNavigationStack(viewController: UIViewController) {
        navigationController.pushViewController(viewController, animated: true)
    }

    func getNavigationController() -> UINavigationController {
        return navigationController
    }
    
}
