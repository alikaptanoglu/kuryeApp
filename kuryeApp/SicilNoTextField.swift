//
//  SicilNoTextField.swift
//  kuryeApp
//
//  Created by burgan on 6.12.2019.
//  Copyright © 2019 burgan. All rights reserved.
//

import UIKit

@IBDesignable
open class SicilNoTextField: UIView,UITextFieldDelegate {
    
    @IBOutlet weak var sicilNoLabel: UILabel!
    @IBOutlet weak var sicilNoTextField: UITextField!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
}
func setup() {
    
    
}


