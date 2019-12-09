//
//  BaseViewController.swift
//  kuryeApp
//
//  Created by burgan on 4.12.2019.
//  Copyright © 2019 burgan. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        if #available(iOS 13.0, *) {
            self.view.backgroundColor = UIColor.systemBackground
        } else {
            // Fallback on earlier versions
        }
        // Do any additional setup after loading the view.
    }

}
