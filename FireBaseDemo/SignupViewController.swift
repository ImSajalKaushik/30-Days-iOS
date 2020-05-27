//
//  SignupViewController.swift
//  FireBaseDemo
//
//  Created by Sajal Kaushik on 26/05/20.
//  Copyright © 2020 Sajal Kaushik. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class SignupViewController: UIViewController {

    @IBOutlet weak var email: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    var emailAddress: String? = nil
    var pass: String? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setupView() {
        email.delegate = self
        password.delegate = self
    }

    @IBAction func signUp(_ sender: UIButton) {
        if emailAddress != nil, pass != nil {
            Auth.auth().createUser(withEmail: emailAddress!, password: pass!) { (result, err) in
                if err != nil {
                    print("error in sign up:", err!.localizedDescription)
                } else {
                    let uid = result?.user.uid
                    print("Success", result?.credential)
                }
            }
        }
         self.dismiss(animated: true, completion: nil)
    }
    
}

extension SignupViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == email {
            password.becomeFirstResponder()
            emailAddress = email.text
            
        } else {
            pass = password.text
            textField.resignFirstResponder()
        }
        return true
    }
}
