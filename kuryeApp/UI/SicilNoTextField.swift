//
//  SicilNoTextField.swift
//  kuryeApp
//
//  Created by burgan on 6.12.2019.
//  Copyright © 2019 burgan. All rights reserved.
//

import UIKit
import ServiceSpaceX
import SwiftValidator

@IBDesignable
class SicilNoTextField: UIView,UITextFieldDelegate,ValidationDelegate {
    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var sicilNoTextField: UITextField!
    @IBOutlet weak var sicilNoLabel: UILabel!
    
    
    let validator = Validator()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configure()
        

    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.configure()


    }
    
    
    
    func configure() {

        Bundle.main.loadNibNamed("SicilNoTextField", owner: self, options: nil)
        self.addFullSizeSubview(view: self.contentView)

        self.sicilNoTextField.placeholder = "Sicil No"
        
        self.sicilNoLabel.isHidden = true
        self.sicilNoLabel.isHidden = true
        self.sicilNoTextField.delegate = self
        
        validator.registerField(sicilNoTextField, errorLabel: sicilNoLabel, rules: [RequiredRule(), MaxLengthRule(length: 10),MinLengthRule(length: 5 ,message: "Must be at min 5 characters long"),CharacterSetRule(characterSet: CharacterSet.init(charactersIn: "0123456789"), message: "Enter valid numeric character")])
        
        validator.styleTransformers(success:{ (validationRule) -> Void in
            print("here")
            // clear error label
            validationRule.errorLabel?.isHidden = false
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
    }
    
    func validate()  {
        self.validator.validate(self)
    }
    
    
    func validationFailed(_ errors: [(Validatable, ValidationError)]) {
        print("")
        
        for (field, error) in errors {
            if let field = field as? UITextField {
                field.layer.borderColor = UIColor.red.cgColor
                field.layer.borderWidth = 1.0
            }
            error.errorLabel?.text = error.errorMessage // works if you added labels
            error.errorLabel?.isHidden = false
        }
        self.sicilNoLabel.isHidden = false
    }
    
    func validationSuccessful() {
        print("")
        self.sicilNoLabel.isHidden = true
        
        
    }
    
}


