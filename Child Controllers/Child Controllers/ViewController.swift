//
//  ViewController.swift
//  Child Controllers
//
//  Created by Sajal Kaushik on 03/06/20.
//  Copyright © 2020 Sajal Kaushik. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var progressView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        progressView.layer.shadowColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
        progressView.layer.shadowOpacity = 0.8
        progressView.layer.shadowOffset = CGSize(width: 3, height: 3)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ToChildVC" {
            if let vc = segue.destination as? ChildViewController {
                vc.progress = 0.3
            }
        }
    }

}

