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
}

class FlowViewControllerImplementation: UIViewController, FlowViewController {

    func pushToNavigationStack(viewController: UIViewController) {
        self.navigationController?.pushViewController(viewController, animated: true)
    }

}
