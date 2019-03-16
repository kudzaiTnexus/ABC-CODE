//
//  SpinnerView.swift
//  ABC-CODE
//
//  Created by Kudzai Mhou on 2019/03/16.
//  Copyright © 2019 Kudzai Mhou. All rights reserved.
//

import Foundation
import JTMaterialSpinner

protocol SpinnerView {
    func showLoader()
    func hideLoader()
}

class SpinnerViewImplementation: SpinnerView {
    
    var spinnerView = JTMaterialSpinner()
    
    func showLoader() {
        spinnerView.circleLayer.lineWidth = 2.0
        spinnerView.circleLayer.strokeColor = UIColor.orange.cgColor
        spinnerView.animationDuration = 30
        spinnerView.beginRefreshing()
    }
    
    func hideLoader() {
        spinnerView.endRefreshing()
    }

}
