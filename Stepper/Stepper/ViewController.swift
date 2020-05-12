//
//  ViewController.swift
//  Stepper
//
//  Created by Sajal Kaushik on 12/05/20.
//  Copyright © 2020 Sajal Kaushik. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var stepper: UIStepper!
    
    @IBOutlet weak var centerlbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = #colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1)
        stepper.autorepeat = true
        stepper.minimumValue = 1
        stepper.maximumValue = 256
        stepper.stepValue = 2
    }

    @IBAction func stepperPressed(_ sender: UIStepper) {
        centerlbl.text = String(sender.value)
    }
    
}

extension UIColor {
    static var random: UIColor {
        return UIColor(red: .random(in: 0...1),
                       green: .random(in: 0...1),
                       blue: .random(in: 0...1),
                       alpha: 1.0)
    }
}
