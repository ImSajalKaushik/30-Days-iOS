//
//  ChildViewController.swift
//  Child Controllers
//
//  Created by Sajal Kaushik on 03/06/20.
//  Copyright © 2020 Sajal Kaushik. All rights reserved.
//

import UIKit

class ChildViewController: UIViewController {
    @IBOutlet weak var progressView: UIProgressView!
    var progress: Float?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        progressView.layer.shadowColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        progressView.layer.shadowOpacity = 0.8
        progressView.layer.shadowOffset = CGSize(width: 3, height: 3)
    }
}
