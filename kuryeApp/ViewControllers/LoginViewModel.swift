//
//  LoginViewModel.swift
//  kuryeApp
//
//  Created by Nihat Basmacı on 9.12.2019.
//  Copyright © 2019 burgan. All rights reserved.
//

import UIKit
import ServiceSpaceX

class LoginViewModel: BaseViewModel {
    
    var tokenResponse : TokenModel?
    
    
    func getToken()  {
        
        UIManager.showHUD()
        self.getToken { (result) in
            UIManager.hideHUD()
            switch result {
            case .success(let response):
                print("")
                break
            case .failure(let error):
                print("")
                break
            }
        }
    }
    
    func getToken(completion: @escaping (_ result: APIResult<TokenModel>) -> Void) {
        Network<API>().request(target: .login, completion: completion)
    }
    
    
}
