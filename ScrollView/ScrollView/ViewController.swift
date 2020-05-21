//
//  ViewController.swift
//  ScrollView
//
//  Created by Sajal Kaushik on 21/05/20.
//  Copyright © 2020 Sajal Kaushik. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var topLabel: UILabel!
    
    @IBOutlet weak var imageViewTopContraints: NSLayoutConstraint!
    @IBOutlet weak var imageViewBottomConstraints: NSLayoutConstraint!
    @IBOutlet weak var buttonTopContraints: NSLayoutConstraint!
    @IBOutlet weak var bottomLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var bottomConstraints: NSLayoutConstraint!
    @IBOutlet weak var buttonTopConstaints: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setupView() {
        topLabel.text = "What is Lorem Ipsum?"
        bottomLabel.text = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book."
        imageView.image = #imageLiteral(resourceName: "WhatsApp Image 2020-05-17 at 20.57.19")
        imageView.contentMode = .center
    }

}

