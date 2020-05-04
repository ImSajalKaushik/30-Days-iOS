//
//  ViewController.swift
//  Custom Alert
//
//  Created by Sajal Kaushik on 04/05/20.
//  Copyright © 2020 Sajal Kaushik. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func buttonTapped(_ sender: Any) {
        let model = CustomAlertViewModel(title: "Hey", message: "This is the message which goes in custom alert text", primaryButtonTitle: "Press here for nothing", secondaryButtonTitle: "Secondary button")
        showAlert(sender: self, alertViewModel: model, primaryButtonAction: nil, secondaryButtonAction: nil)
    }
    
    func showAlert(sender: UIViewController,
                         alertViewModel: CustomAlertViewModel,
                         primaryButtonAction: (() -> Void)?,
                         secondaryButtonAction: (() -> Void)?,
                         closeButtonAction: (() -> Void)? = nil) {
        let alertViewController = CustomAlertViewController(nibName: String(describing: CustomAlertViewController.self),
                                                                 viewModel: alertViewModel,
                                                                 primaryButtonAction: primaryButtonAction,
                                                                 secondaryButtonAction: secondaryButtonAction,
                                                                 closeButtonAction: closeButtonAction)
        alertViewController.modalTransitionStyle = .crossDissolve
        alertViewController.modalPresentationStyle = .overFullScreen
        sender.present(alertViewController, animated: true, completion: nil)
    }
}

