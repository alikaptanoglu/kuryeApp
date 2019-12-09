//
//  AppDelegate.swift
//  kuryeApp
//
//  Created by burgan on 2.12.2019.
//  Copyright © 2019 burgan. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift



@available(iOS 13.0, *)
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    var initialViewController :UIViewController?
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        IQKeyboardManager.shared.enable = true
        IQKeyboardManager.shared.enableAutoToolbar = true
        IQKeyboardManager.shared.shouldShowToolbarPlaceholder = true
        IQKeyboardManager.shared.shouldResignOnTouchOutside = true
        IQKeyboardManager.shared.toolbarDoneBarButtonItemText = "Tamam".localized
        IQKeyboardManager.shared.keyboardDistanceFromTextField = 70
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        let nav1 = UINavigationController()
        let mainView = LoginViewController(nibName: nil, bundle: nil) //ViewController = Name of your controller
        nav1.viewControllers = [mainView]
        self.window!.rootViewController = nav1
        self.window?.makeKeyAndVisible()
        
        return true
    }
    
    
    
    
}

