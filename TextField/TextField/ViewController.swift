//
//  ViewController.swift
//  TextField
//
//  Created by Sajal Kaushik on 10/05/20.
//  Copyright © 2020 Sajal Kaushik. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var ageLabel: UILabel!
    
    @IBOutlet weak var phoneLabel: UILabel!
    
    @IBOutlet weak var genderLabel: UILabel!
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var ageTextField: UITextField!
    
    @IBOutlet weak var phoneNumberTextField: UITextField!
    
    @IBOutlet weak var genderTextField: UITextField!
    
    @IBOutlet weak var editBUtton: UIButton!
    
    var edited: Bool = false {
        willSet {
            if newValue == true {
                editBUtton.isHidden = false
            } else {
                editBUtton.isHidden = true
            }
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        edited = false
        let gesture = UITapGestureRecognizer(target: self, action: #selector(viewTapped))
        self.view.addGestureRecognizer(gesture)
    }
    
    @objc func viewTapped() {
        self.view.endEditing(true)
    }
    
    func setupUI() {
        editBUtton.backgroundColor = .clear
        editBUtton.setTitleColor(.white, for: .normal)
        editBUtton.layer.cornerRadius = editBUtton.bounds.height/2
        editBUtton.layer.borderWidth = 2
        editBUtton.layer.borderColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
        nameTextField.delegate = self
        ageTextField.delegate = self
        phoneNumberTextField.delegate = self
        genderTextField.delegate = self
        nameTextField.delegate = self
        nameLabel.textColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
        ageLabel.textColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
        phoneLabel.textColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
        genderLabel.textColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
    }
    
    @IBAction func editClicked(_ sender: Any) {
        if !edited {
            nameTextField.isHidden = true
            ageTextField.isHidden = true
            phoneNumberTextField.isHidden = true
            genderTextField.isHidden = true
        }
        else {
            nameTextField.isHidden = false
            ageTextField.isHidden = false
            phoneNumberTextField.isHidden = false
            genderTextField.isHidden = false
        }
    }
}

extension ViewController: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
         if textField == ageTextField {
             textField.resignFirstResponder()
             ageLabel.text = textField.text
             phoneNumberTextField.becomeFirstResponder()
         }
        if textField == genderTextField {
            view.endEditing(true)
            genderLabel.text = textField.text
        }
       textField.isHidden = true
        edited = true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == nameTextField {
            textField.resignFirstResponder()
            nameLabel.text = textField.text
            ageTextField.becomeFirstResponder()
        }
        else if textField == phoneNumberTextField {
            textField.resignFirstResponder()
            phoneLabel.text = textField.text
            genderTextField.becomeFirstResponder()
        } else {
            view.endEditing(true)
        }
        textField.isHidden = true
        return true
    }
}
