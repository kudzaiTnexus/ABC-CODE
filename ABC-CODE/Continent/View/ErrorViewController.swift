//
//  ErrorViewController.swift
//  ABC-CODE
//
//  Created by Kudzai Mhou on 2019/03/15.
//  Copyright © 2019 Kudzai Mhou. All rights reserved.
//

import UIKit

class ErrorViewController: UIViewController {
    @IBOutlet weak var errorMessage: UILabel!
    @IBOutlet weak var tryAgainImageButton: UIImageView!
    
    private let continent: String
    private var viewModel = ContinentCountriesViewModelImplementation()
    
    init(continent: String) {
        self.continent = continent
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
       return nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }

    func setUpView() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleRetryButtonTapped))
        tryAgainImageButton.addGestureRecognizer(tapGesture)
        errorMessage.text = "error.nessage.title".localized(in: .ErrorStrings)
    }
    
    @objc func handleRetryButtonTapped(gesture: UITapGestureRecognizer) {
        viewModel.tryAgainTapped(continent: continent)
    }

}
