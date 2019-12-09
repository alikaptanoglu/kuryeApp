//
//  LoginViewController.swift
//  kuryeApp
//
//  Created by burgan on 2.12.2019.
//  Copyright © 2019 burgan. All rights reserved.
//



import UIKit
import SwiftValidator
import ServiceSpaceX




class LoginViewController: BaseViewController ,UITextFieldDelegate {
    
    @IBOutlet weak var loginImage: UIImageView!
    @IBOutlet weak var userName: UsernameTextField!
    @IBOutlet weak var password: SicilNoTextField!
    @IBOutlet weak var loginButton: CustomButton!

    var loginViewModel = LoginViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    @IBAction func loginAction(_ sender: Any) {
        self.userName.validate()
        self.password.validate()
        
        self.loginViewModel.getToken()
        self.loginViewModel.onLoadEnd = {
            print("")
        }
    }
    

    
    
    
}
