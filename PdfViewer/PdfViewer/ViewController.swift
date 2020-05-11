//
//  ViewController.swift
//  PdfViewer
//
//  Created by Sajal Kaushik on 11/05/20.
//  Copyright © 2020 Sajal Kaushik. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var showPDFButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showPDFButton.layer.borderColor = UIColor.systemGreen.cgColor
        showPDFButton.layer.cornerRadius =  10
        showPDFButton.layer.borderWidth = 2
    }


}

