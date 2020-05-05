//
//  ViewController.swift
//  NeomorphicView
//
//  Created by Sajal Kaushik on 05/05/20.
//  Copyright © 2020 Sajal Kaushik. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var customView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.offWhite
        self.addShadow(view: customView)
    }
    
    func addShadow(view: UIView) {
        view.backgroundColor = UIColor.offWhite
        let bottomShadow = CALayer()
        let topShadow = CALayer()
        view.layer.cornerRadius = 15
        bottomShadow.shadowPath = UIBezierPath(rect: view.bounds).cgPath
        bottomShadow.frame = CGRect(x: view.frame.origin.x, y: view.frame.origin.y, width: view.frame.size.width, height: view.frame.height)
        bottomShadow.shadowColor = UIColor.black.withAlphaComponent(0.2).cgColor
        bottomShadow.shadowOffset = CGSize(width: 10, height: 10)
        bottomShadow.shadowOpacity = 1
        bottomShadow.shadowRadius = view.layer.cornerRadius
        bottomShadow.shouldRasterize = true
        topShadow.shadowPath = UIBezierPath(rect: view.bounds).cgPath
        topShadow.frame = CGRect(x: view.frame.origin.x, y: view.frame.origin.y, width: view.frame.size.width, height: view.frame.height)
        topShadow.cornerRadius = 15
        topShadow.shadowColor = UIColor.white.withAlphaComponent(0.7).cgColor
        topShadow.shadowOffset = CGSize(width: -5, height: -5)
        topShadow.shadowRadius = view.layer.cornerRadius
        topShadow.shadowOpacity = 1
        topShadow.shouldRasterize = true
        self.view.layer.insertSublayer(bottomShadow, below: view.layer)
        self.view.layer.insertSublayer(topShadow, below: view.layer)
    }
}

extension UIColor {
    static let offWhite = UIColor.init(red: 225/255, green: 225/255, blue: 235/255, alpha: 1)
}
