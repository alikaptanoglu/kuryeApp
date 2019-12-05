//
//  LoginViewController.swift
//  kuryeApp
//
//  Created by burgan on 2.12.2019.
//  Copyright © 2019 burgan. All rights reserved.
//

import UIKit

class LoginViewController: BaseViewController ,UITextFieldDelegate {
    
    @IBOutlet weak var adSoyad: UITextField!
    @IBOutlet weak var kuryeSicilNo: UITextField!
    @IBOutlet weak var loginImage: UIImageView!
    @IBOutlet weak var loginButton: CustomButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.adSoyad.delegate = self
        self.kuryeSicilNo.delegate = self
        
        
        loginButton.addTarget(self, action: #selector(basvuruEkran), for: .touchUpInside)
     
        
        // Do any additional setup after loading the view.
    }
    
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if kuryeSicilNo.isEditing == true{
            let invalidCharacters = CharacterSet(charactersIn: "0123456789").inverted
            return string.rangeOfCharacter(from: invalidCharacters) == nil
        }
        else{
            let invalidCharacters = CharacterSet(charactersIn: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLKMNOPQRSTUVWXYZ ").inverted
            return string.rangeOfCharacter(from: invalidCharacters) == nil
        }
    }
    
    @objc func basvuruEkran (){
            let vc = BasvuruViewController()
        navigationController?.pushViewController(vc, animated: true)
            
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
