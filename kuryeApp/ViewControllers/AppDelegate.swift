//
//  AppDelegate.swift
//  kuryeApp
//
//  Created by burgan on 2.12.2019.
//  Copyright © 2019 burgan. All rights reserved.
//

import UIKit
import ServiceSpaceX

@available(iOS 13.0, *)
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    var initialViewController :UIViewController?
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        initialViewController  = LoginViewController(nibName:"LoginViewController",bundle:nil)
        
        let frame = UIScreen.main.bounds
        window = UIWindow(frame: frame)
        
        window!.rootViewController = initialViewController
        window!.makeKeyAndVisible()
        
        ServiceManager.serverTrustPolicy()
        
        Managers.shared.serviceURLConstansType = .live
//        Managers.shared.serviceManager.constants.apiURL = ""
        
        return true
    }
    
    
    
    
}

