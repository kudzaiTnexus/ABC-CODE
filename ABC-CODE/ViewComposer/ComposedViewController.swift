//
//  ComposedViewController.swift
//  ABC-CODE
//
//  Created by Kudzai Mhou on 2019/03/15.
//  Copyright © 2019 Kudzai Mhou. All rights reserved.
//

import Foundation
import UIKit

protocol ComposedViewController {
    func add(toView parent: UIViewController)
    func removeFromView()
}

extension UIViewController: ComposedViewController {
    
    func add(toView parent: UIViewController) {
        view.frame = parent.view.bounds
        parent.addChildViewController(self)
        parent.view.addSubview(view)
        parent.view.bringSubview(toFront: view)
        didMove(toParentViewController: parent)
    }
    
    func removeFromView() {
        willMove(toParentViewController: nil)
        removeFromParentViewController()
        view.removeFromSuperview()
    }
    
}
