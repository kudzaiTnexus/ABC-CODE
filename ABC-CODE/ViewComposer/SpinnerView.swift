//
//  SpinnerView.swift
//  ABC-CODE
//
//  Created by Kudzai Mhou on 2019/03/16.
//  Copyright © 2019 Kudzai Mhou. All rights reserved.
//

import Foundation
import UIKit
import SVProgressHUD

protocol SpinnerView {
    func showLoader()
    func hideLoader()
}

class SpinnerViewImplementation: SpinnerView {
    
    func showLoader() {
        let message = "Loading ..."
        SVProgressHUD.setRingRadius(40)
        SVProgressHUD.setForegroundColor(UIColor.loaderColor())
        SVProgressHUD.show(withStatus: message)
    }
    
    func hideLoader() {
        SVProgressHUD.dismiss()
    }

}
