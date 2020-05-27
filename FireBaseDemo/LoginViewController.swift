//
//  LoginViewController.swift
//  FireBaseDemo
//
//  Created by Sajal Kaushik on 27/05/20.
//  Copyright © 2020 Sajal Kaushik. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class LoginViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var emailID: UITextField!
    @IBOutlet weak var passwordID: UITextField!
    var email: String? = nil
    var password: String? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailID.delegate = self
        passwordID.delegate = self
    }
    
    @IBAction func signInTapped(_ sender: UIButton) {
        if let email = email, let password = password {
            Auth.auth().signIn(withEmail: email, password: password) { (result, err) in
                if (err == nil) {
                    print("success")
                     self.dismiss(animated: true, completion: nil)
                } else {
                    print(err?.localizedDescription)
                }
            }
        }
    }
    
}

extension LoginViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == emailID {
            passwordID.becomeFirstResponder()
            email = emailID.text
            
        } else {
            password = passwordID.text
            textField.resignFirstResponder()
        }
        return true
    }
}
