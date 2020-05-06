//
//  ViewController.swift
//  CAShapeLayer
//
//  Created by Sajal Kaushik on 06/05/20.
//  Copyright © 2020 Sajal Kaushik. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let backGroundLayer =  CAShapeLayer()
    let progressBar = CAShapeLayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addLayer()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(viewTapped))
        view.addGestureRecognizer(tapGesture)
    }
    
    func addLayer() {
        let circularPath = UIBezierPath(arcCenter: self.view.center, radius: 100, startAngle: -.pi/2, endAngle: 2*(.pi), clockwise: true)
        backGroundLayer.path = circularPath.cgPath
        backGroundLayer.fillColor = UIColor.clear.cgColor
        backGroundLayer.strokeColor = UIColor.lightGray.cgColor
        backGroundLayer.lineCap = .round
        backGroundLayer.lineWidth = 10
        view.layer.addSublayer(backGroundLayer)
        
        progressBar.path = circularPath.cgPath
        progressBar.fillColor = UIColor.clear.cgColor
        progressBar.strokeColor = #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1).cgColor
        progressBar.lineCap = .round
        progressBar.lineWidth = 10
        progressBar.strokeEnd = 0
        view.layer.addSublayer(progressBar)
    }
    
    @objc func viewTapped() {
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        // put from value to anything you want to animate from
//        animation.fromValue = 0
        animation.toValue = 1
        animation.duration = 2
        animation.fillMode = .forwards
        animation.isRemovedOnCompletion = false
        
        progressBar.add(animation, forKey: "progress")
        
    }
}

