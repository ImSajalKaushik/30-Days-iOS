//
//  CustomAlertViewModel.swift
//  Custom Alert
//
//  Created by Sajal Kaushik on 04/05/20.
//  Copyright © 2020 Sajal Kaushik. All rights reserved.
//

import UIKit
/**
 The purpose of the `CustomAlertViewModel` is responsible for setting up UI of custom alert view controller which is associated with `CustomAlertViewController`
 */
class CustomAlertViewModel {
    
    // MARK: - Properties
    
    /// Title to be displayed on the Custom Alert
    let alertTitle: String
    
    /// Message to be displayed on the Custom Alert
    let alertMessage: String
    
    /// Title of primary button to be displayed on the Custom Alert
    let alertPrimaryButtonTitle: String?
    
    /// Title of secondary button to be displayed on the Custom Alert
    let alertSecondaryButtonTitle: String?
    
    let criticalImage: UIImage?
    
    /// Title of primary button to be displayed on the Custom Alert
    let warningTitle: String?

    // MARK: - Initializer
    
    init(title: String, message: String, primaryButtonTitle: String?, secondaryButtonTitle: String?, criticalImage: UIImage? = nil, warningTitle: String? = nil) {
        alertTitle = title
        alertMessage = message
        alertPrimaryButtonTitle = primaryButtonTitle
        alertSecondaryButtonTitle = secondaryButtonTitle
        self.criticalImage = criticalImage
        self.warningTitle = warningTitle
    }
}
