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
    @IBOutlet weak var emptyStringErrorLabel: UILabel!
    
    private let reachAble: Reachability? = Reachability()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emptyStringErrorLabel.text = "empty.text.message".localized(in: .ErrorStrings)
        continentNameTextField?.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
         emptyStringErrorLabel.isHidden = true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        continentNameTextField?.resignFirstResponder()
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        emptyStringErrorLabel.isHidden = true
    }
    
    @IBAction func getFactsButtonAction(_ sender: UIButton) {
        if let continentName = continentNameTextField.text, !continentName.isEmpty, let networkReachAbility = reachAble {
            if networkReachAbility.isInternetAvailable() {
                self.initiateNavigationFlow(continentName: continentName)
            } else {
                showNoInternetAlert(title: "network.reachAbility.alert.title".localized(in: .ReachAbilityStrings),
                                    message: "network.reachAbility.alert.message".localized(in: .ReachAbilityStrings))
            }
        } else {
            emptyStringErrorLabel.isHidden = false
        }
    }
    
    func initiateNavigationFlow(continentName: String) {
        let countriesViewController = CountriesViewController(continent: continentName)
        self.navigationController?.pushViewController(countriesViewController, animated: true)
    }
    
    func showNoInternetAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title,
                                                message: message, preferredStyle: UIAlertControllerStyle.alert)
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) {
            (result : UIAlertAction) -> Void in
        }
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
}

