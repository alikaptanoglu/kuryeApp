//
//  LoginViewController.swift
//  kuryeApp
//
//  Created by burgan on 2.12.2019.
//  Copyright © 2019 burgan. All rights reserved.
//



import UIKit
import SwiftValidator





class LoginViewController: BaseViewController ,UITextFieldDelegate,ValidationDelegate {
    
    @IBOutlet weak var adSoyad: UITextField!
    @IBOutlet weak var kuryeSicilNo: UITextField!
    @IBOutlet weak var loginImage: UIImageView!
    @IBOutlet weak var loginButton: CustomButton!
    
    @IBOutlet weak var errorSicilNo: UILabel!
    @IBOutlet weak var errorAdSoyad: UILabel!
    let validator = Validator()
  
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.adSoyad.delegate = self
        self.kuryeSicilNo.delegate = self
        
        
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(LoginViewController.hideKeyboard)))
        
        
        validator.styleTransformers(success:{ (validationRule) -> Void in
            print("here")
            // clear error label
            validationRule.errorLabel?.isHidden = true
            validationRule.errorLabel?.text = ""
            
            if let textField = validationRule.field as? UITextField {
                textField.layer.borderColor = UIColor.green.cgColor
                textField.layer.borderWidth = 0.5
            } else if let textField = validationRule.field as? UITextView {
                textField.layer.borderColor = UIColor.green.cgColor
                textField.layer.borderWidth = 0.5
            }
        }, error:{ (validationError) -> Void in
            print("errorLabel")
            validationError.errorLabel?.isHidden = false
            validationError.errorLabel?.text = validationError.errorMessage
            if let textField = validationError.field as? UITextField {
                textField.layer.borderColor = UIColor.red.cgColor
                textField.layer.borderWidth = 1.0
            } else if let textField = validationError.field as? UITextView {
                textField.layer.borderColor = UIColor.red.cgColor
                textField.layer.borderWidth = 1.0
            }
        })
        
        validator.registerField(kuryeSicilNo, errorLabel: errorSicilNo, rules: [RequiredRule(), MaxLengthRule(length: 10),MinLengthRule(length: 5 ,message: "Must be at min 5 characters long"),CharacterSetRule(characterSet: CharacterSet.init(charactersIn: "0123456789"), message: "Enter valid numeric character")])
        validator.registerField(adSoyad,errorLabel: errorAdSoyad, rules: [FullNameRule(),RequiredRule(),CharacterSetRule(characterSet: CharacterSet.init(charactersIn: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLKMNOPQRSTUVWXYZ "), message: "Enter valid character"),MaxLengthRule(length: 50,message: "Unvalid name or surname"),MinLengthRule(length: 5,message: "Unvalid name or surname")])
        
        
        loginButton.addTarget(self, action: #selector(basvuruEkran), for: .touchUpInside)
        
        
    }
    
    
    @objc func basvuruEkran (){
        //        let vc = BasvuruViewController()
        //        navigationController?.pushViewController(vc, animated: true)
        validator.validate(self)
        
    }
    
    func validationSuccessful() {
        print("Validation Success!")
        let alert = UIAlertController(title: "Success", message: "You are validated!", preferredStyle: UIAlertController.Style.alert)
        let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(defaultAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    func validationFailed(_ errors:[(Validatable ,ValidationError)]) {
        // turn the fields to red
        for (field, error) in errors {
            if let field = field as? UITextField {
                field.layer.borderColor = UIColor.red.cgColor
                field.layer.borderWidth = 1.0
            }
            error.errorLabel?.text = error.errorMessage // works if you added labels
            error.errorLabel?.isHidden = false
        }
    }
    @objc func hideKeyboard(){
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        validator.validateField(textField){ error in
            if error == nil {
                // Field validation was successful
            } else {
                // Validation error occurred
            }
        }
        return true
    }
    
    
    
    
}



//    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//        if kuryeSicilNo.isEditing == true{
//            let invalidCharacters = CharacterSet(charactersIn: "0123456789").inverted
//            return string.rangeOfCharacter(from: invalidCharacters) == nil
//        }
//        else{
//            let invalidCharacters = CharacterSet(charactersIn: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLKMNOPQRSTUVWXYZ ").inverted
//            return string.rangeOfCharacter(from: invalidCharacters) == nil
//        }
//    }

// validator.registerField(kuryeSicilNo, errorLabel: errorSicilNo, rules: [RequiredRule(), MinLengthRule(length: 5)])
