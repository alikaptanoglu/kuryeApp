//
//  ValidationSystem.swift
//  kuryeApp
//
//  Created by burgan on 6.12.2019.
//  Copyright © 2019 burgan. All rights reserved.
////
//enum Register {
//    case emai
//}
//import UIKit
//import Foundation
//import SwiftValidator
//
//class ValidationSystem: BaseViewController,ValidationDelegate,UITextFieldDelegate {
//   
//    
//    
//    let validator = Validator()
//    let loginVc = LoginViewController ()
//
//   
//        func validationLabelSituationColour(){
//            
//       
//            validator.styleTransformers(success:{ (validationRule) -> Void in
//                print("here")
//                // clear error label
//                validationRule.errorLabel?.isHidden = true
//                validationRule.errorLabel?.text = ""
//                
//                if let textField = validationRule.field as? UITextField {
//                    textField.layer.borderColor = UIColor.green.cgColor
//                    textField.layer.borderWidth = 0.5
//                } else if let textField = validationRule.field as? UITextView {
//                    textField.layer.borderColor = UIColor.green.cgColor
//                    textField.layer.borderWidth = 0.5
//                }
//            }, error:{ (validationError) -> Void in
//                print("error")
//                validationError.errorLabel?.isHidden = false
//                validationError.errorLabel?.text = validationError.errorMessage
//                if let textField = validationError.field as? UITextField {
//                    textField.layer.borderColor = UIColor.red.cgColor
//                    textField.layer.borderWidth = 1.0
//                } else if let textField = validationError.field as? UITextView {
//                    textField.layer.borderColor = UIColor.red.cgColor
//                    textField.layer.borderWidth = 1.0
//                }
//            })
//        }
//                
//           func validationSuccessful() {
//               print("Validation Success!")
//               let alert = UIAlertController(title: "Success", message: "You are validated!", preferredStyle: UIAlertController.Style.alert)
//               let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
//               alert.addAction(defaultAction)
//               self.present(alert, animated: true, completion: nil)
//           
//           }
//           func validationFailed(_ errors:[(Validatable, ValidationError)]) {
//               print("Validation FAILED!")
//           }
//           
//           func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//                   validator.validateField(textField){ error in
//                       if error == nil {
//                           // Field validation was successful
//                       } else {
//                           // Validation error occurred
//                       }
//                   }
//               return true
//           }
//    
//        func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//            if self.loginVc.kuryeSicilNo.isEditing == true{
//                let invalidCharacters = CharacterSet(charactersIn: "0123456789").inverted
//                return string.rangeOfCharacter(from: invalidCharacters) == nil
//            }
//            else{
//                let invalidCharacters = CharacterSet(charactersIn: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLKMNOPQRSTUVWXYZ ").inverted
//                return string.rangeOfCharacter(from: invalidCharacters) == nil
//            }
//        }
//
//}
//
