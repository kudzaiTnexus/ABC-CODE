//
//  ViewController.swift
//  ABC-CODE
//
//  Created by Kudzai Mhou on 2019/03/13.
//  Copyright © 2019 Kudzai Mhou. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var continentNameTextField: UITextField!
    @IBOutlet weak var getFactsButton: UIButton!
    
    private let reachAble: Reachability? = Reachability()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        continentNameTextField?.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        continentNameTextField?.resignFirstResponder()
        return true
    }
    
    @IBAction func getFactsButtonAction(_ sender: UIButton) {
        if let continentName = continentNameTextField.text, let networkReachAbility = reachAble {
            if networkReachAbility.isInternetAvailable() {
                self.initiateNavigationFlow(continentName: continentName)
            } else {
                showNoInternetAlert()
            }
        }
    }
    
    func initiateNavigationFlow(continentName: String) {
        let countriesViewController = CountriesViewController(continent: continentName)
        self.navigationController?.pushViewController(countriesViewController, animated: true)
    }
    
    func showNoInternetAlert() {
        let alertController = UIAlertController(title: "network.reachAbility.alert.title".localized(in: .ReachAbilityStrings),
                                                message: "network.reachAbility.alert.message".localized(in: .ReachAbilityStrings), preferredStyle: UIAlertControllerStyle.alert)
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) {
            (result : UIAlertAction) -> Void in
        }
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
}

