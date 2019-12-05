//
//  AppDelegate.swift
//  kuryeApp
//
//  Created by burgan on 2.12.2019.
//  Copyright © 2019 burgan. All rights reserved.
//

import UIKit
import ServiceSpaceX
import IQKeyboardManagerSwift

@available(iOS 13.0, *)
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    var initialViewController :UIViewController?
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        self.window = UIWindow(frame: UIScreen.main.bounds)
         let nav1 = UINavigationController()
         let mainView = LoginViewController(nibName: nil, bundle: nil) //ViewController = Name of your controller
         nav1.viewControllers = [mainView]
         self.window!.rootViewController = nav1
         self.window?.makeKeyAndVisible()
        
        
        
        Managers.shared.serviceURLConstansType = .live
        //        Managers.shared.serviceManager.constants.apiURL = ""
        IQKeyboardManager.shared.enable = true
        return true
    }
    
    
    
    
}

