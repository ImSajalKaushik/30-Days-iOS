//
//  CustomAlertViewController.swift
//  Custom Alert
//
//  Created by Sajal Kaushik on 04/05/20.
//  Copyright © 2020 Sajal Kaushik. All rights reserved.
//

import UIKit

/**
 The purpose of the `CustomAlertViewController` is to create custom alert views
 
 There's a matching scene in the *CustomAlertViewController.xib* file
 
 The `CustomAlertViewController` class is a subclass of the `UIViewController`
 */
final class CustomAlertViewController: UIViewController {
    
    // MARK: - Properties
    
    private var viewModel: CustomAlertViewModel
    
    // MARK: - Outlets
    
    /// Custom alert view background
    @IBOutlet private weak var alertView: UIView!
    
    /// Header view, contains critical image and close button
    @IBOutlet private weak var alertHeaderView: UIView!
    
    /// ImageView at the top of alert
    @IBOutlet private weak var criticalImageView: UIImageView!
    
    /// Close button at the top of alert
    @IBOutlet private weak var closeButton: UIButton!
    
    /// Title on alert view
    @IBOutlet weak var alertTitle: UILabel!
    
    /// Message on alert view
    @IBOutlet weak var alertMessage: UILabel!
    
    /// Primary button of alert view, by default primarycolor backgroundColor
    @IBOutlet weak var primaryButton: UIButton!
    
    /// Secondary button of alert view, by default underlined primarycolor
    @IBOutlet weak var secondaryButton: UIButton!
    
    // MARK: - Closures
    
    /// Primary button action closure
    private var primaryButtonAction: (() -> Void)?
    
    /// Secondary button action closure
    private var secondaryButtonAction: (() -> Void)?
    
    /// Close Button Action Closure
    private var closeButtonAction: (() -> Void)?
    
    // MARK: - Initialisers
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    /**
     Initialises CustomAlertViewController
     
     - Parameter nibName: Nibname associated with the viewcontroller
     - Parameter viewModel: instance of `CustomAlertViewModel`
     - Parameter primaryButtonAction: Action associated with primaryButton of alert.
     - Parameter secondaryButtonAction: Action associated with secondaryButton of alert.
     - Parameter closeButtonAction: Action associated with  close of alert.

     */

    init(nibName: String,
         viewModel: CustomAlertViewModel,
         primaryButtonAction: (() -> Void)?,
         secondaryButtonAction: (() -> Void)?,
         closeButtonAction:(() -> Void)?) {
        self.viewModel = viewModel
        self.primaryButtonAction = primaryButtonAction
        self.secondaryButtonAction = secondaryButtonAction
        self.closeButtonAction = closeButtonAction
        super.init(nibName: nibName, bundle: nil)
    }
    
    // MARK: - LifeCycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setUpAlertView(alertViewModel: viewModel,
                       primaryButtonAction: primaryButtonAction,
                       secondaryButtonAction: secondaryButtonAction,
                       closeButtonAction: closeButtonAction)
    }
    
    // MARK: - Helper Methods
    /**
     This function is used to set up alert view's properties
     
     - Parameter alertViewModel: View Model responsible for setting up labels and button titles on custom alert.
     - Parameter primaryButtonAction: Action associated with primaryButton of alert.
     - Parameter secondaryButtonAction: Action associated with secondaryButton of alert.
     - Parameter closeButtonAction: Action associated with  close of alert.
     
     */
    private func setUpAlertView(alertViewModel: CustomAlertViewModel,
                                primaryButtonAction: (() -> Void)?,
                                secondaryButtonAction: (() -> Void)?,
                                closeButtonAction:(() -> Void)?) {
        alertTitle.text = alertViewModel.alertTitle
        alertMessage.text = alertViewModel.alertMessage
        if let buttontitle = alertViewModel.alertPrimaryButtonTitle {
            primaryButton.setTitle(buttontitle, for: .normal)
            self.primaryButtonAction = primaryButtonAction
        } else {
            primaryButton.isHidden = true
        }
        if let buttontitle = alertViewModel.alertSecondaryButtonTitle {
            let underlinedTitle = NSAttributedString(string: buttontitle,
                                                     attributes: [.underlineStyle: NSUnderlineStyle.single.rawValue,
                                                                  .foregroundColor: UIColor.red])
            secondaryButton.setAttributedTitle(underlinedTitle, for: .normal)
            self.secondaryButtonAction = secondaryButtonAction
        } else {
            secondaryButton.isHidden = true
        }
        if let closeAction = closeButtonAction {
            self.closeButtonAction = closeAction
        } else {
            // if there is no action passed, set the close button image to nil
            self.closeButton.setImage(nil, for: .normal)
        }
        if let criticalImage = alertViewModel.criticalImage {
            self.criticalImageView.image = criticalImage
        }
    }
    
    /**
     The purpose of this function is to set up the default appearance of the views of  `CustomAlertViewController`
     */
    private func setupUI() {
        alertView.layer.cornerRadius = 15
        alertView.layer.shadowPath = UIBezierPath(roundedRect: alertView.bounds, cornerRadius: alertView.layer.cornerRadius).cgPath
        alertView.layer.shadowColor = UIColor.darkGray.cgColor
        alertView.layer.shadowOffset = CGSize(width: 0, height: 2)
        alertView.layer.shadowOpacity = 0.50
        alertView.layer.shadowRadius = 3.0
        alertView.layer.masksToBounds = false
        alertView.clipsToBounds = true
        primaryButton.backgroundColor = UIColor.blue
        primaryButton.layer.cornerRadius = primaryButton.bounds.height/2
        primaryButton.setTitleColor(.white, for: .normal)
    }
    
    // MARK: - IBActions
    
    /**
     Decides what action to be performed when primary button of the alert is clicked
     
     - Parameter sender: primaryButton on Custom Alert
     */
    @IBAction private func primaryButtonTapped(_ sender: UIButton) {
        dismiss(animated: true)
        if let action = primaryButtonAction {
            action()
        } else {
            primaryButton.isHidden = true
        }
    }
    
    /**
     Decides what action to be performed when secondary button of the alert is clicked
     
     - Parameter sender: secondaryButton on Custom Alert.
     */
    @IBAction private func secondaryButtonTapped(_ sender: UIButton) {
        dismiss(animated: true)
        if let action = secondaryButtonAction {
            action()
        } else {
            secondaryButton.isHidden = true
        }
    }
    
    /**
     Decides what action to be performed when close button of the alert is clicked
     
     - Parameter sender: closeButton  on Custom Alert.
     */
    @IBAction private func closeButtonTapped(_ sender: UIButton) {
        dismiss(animated: true)
        if let action = closeButtonAction {
            action()
        }
    }
}

