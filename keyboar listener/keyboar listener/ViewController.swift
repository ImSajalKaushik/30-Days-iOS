//
//  ViewController.swift
//  keyboar listener
//
//  Created by Sajal Kaushik on 04/06/20.
//  Copyright © 2020 Sajal Kaushik. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardFrameChanged(notification:)), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc func keyboardFrameChanged(notification: NSNotification){
        if let userInfo = notification.userInfo {
            // gives keyboard frame
            let endFrame = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue
            let endFrameY = endFrame?.origin.y ?? 0
            // duration of animation
            let duration = (userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as? NSNumber)?.doubleValue ?? 0
            // yada- yada to get animation curve which I didn't use but you can
            let animationCurveNSN = userInfo[UIResponder.keyboardAnimationCurveUserInfoKey] as? NSNumber
            let animationCurveRaw = animationCurveNSN?.uintValue ?? UIView.AnimationOptions.curveEaseInOut.rawValue
            let animationCurve: UIView.AnimationOptions = UIView.AnimationOptions(rawValue: animationCurveRaw)
            // closing keyboard
            if endFrameY >= UIScreen.main.bounds.height {
                self.bottomConstraint.constant = 0
            } else {
                // coming of keyboard(sounds like a remake of a movie)
                self.bottomConstraint.constant = endFrame?.size.height ?? 0
            }
            UIView.animate(withDuration: duration, animations: {self.view.layoutIfNeeded()})
        }
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

