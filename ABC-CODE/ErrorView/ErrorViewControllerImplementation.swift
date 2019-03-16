//
//  ErrorViewController.swift
//  ABC-CODE
//
//  Created by Kudzai Mhou on 2019/03/15.
//  Copyright © 2019 Kudzai Mhou. All rights reserved.
//

import UIKit

protocol ErrorViewController: ComposedViewController {}

class ErrorViewControllerImplementation: UIViewController, ErrorViewController {
    @IBOutlet weak var errorMessage: UILabel!
    @IBOutlet weak var tryAgainImageButton: UIImageView!
    
    private let errorNotificationMessage: String
    private let onTryAgain: () -> Void
    
    convenience init(onTryAgain: @escaping () -> Void) {
        self.init(errorMessage: "error.nessage.title".localized(in: .ErrorStrings), onTryAgain: onTryAgain)
    }
    
    init(errorMessage: String, onTryAgain: @escaping () -> Void) {
        self.errorNotificationMessage = errorMessage
        self.onTryAgain = onTryAgain
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
        errorMessage.text = errorNotificationMessage
    }
    
    @objc func handleRetryButtonTapped(gesture: UITapGestureRecognizer) {
        onTryAgain()
    }

}
