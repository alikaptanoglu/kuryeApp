//
//  CustomButton.swift
//  kuryeApp
//
//  Created by burgan on 2.12.2019.
//  Copyright © 2019 burgan. All rights reserved.
//

import UIKit



class CustomButton: UIButton {
    
    
    @IBInspectable var titleText: String? {
        didSet {
            self.setTitle(titleText, for: .normal)
        }
    }
    
    @IBInspectable var backgroundColorX: UIColor? {
        didSet{
            self.backgroundColor = backgroundColorX
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat = 15 {
        didSet {
            refreshCorners(value: cornerRadius)
        }
    }
    @IBInspectable var imageText: UIImage? {
          didSet {
            self.setBackgroundImage(imageText, for: .normal)

          }
      }
    
    
    
    var borderWidth: CGFloat = 2.0
    var borderColor = UIColor.white.cgColor
    
    
    override open var isHighlighted: Bool {
        didSet {
            backgroundColor = isHighlighted ?  UIColor.orange : backgroundColorX
            
        }
    }
    
    
    override init(frame: CGRect){
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.setup()
    }
    
    
    func setup() {
        
        self.layer.masksToBounds = true
        self.clipsToBounds = true
        self.layer.borderColor = borderColor
        self.layer.borderWidth = borderWidth
        self.setBackgroundImage(self.imageText, for: .normal)
        
        
        
    }
    func refreshCorners(value: CGFloat) {
        layer.cornerRadius = value
    }
    func sharedInit() {
        refreshCorners(value: cornerRadius)
    }
    
}



extension UIColor {
    public convenience init?(hex: String) {
        let r, g, b, a: CGFloat
        
        if hex.hasPrefix("#") {
            let start = hex.index(hex.startIndex, offsetBy: 1)
            let hexColor = String(hex[start...])
            
            if hexColor.count == 8 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0
                
                if scanner.scanHexInt64(&hexNumber) {
                    r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                    g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                    b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                    a = CGFloat(hexNumber & 0x000000ff) / 255
                    
                    self.init(red: r, green: g, blue: b, alpha: a)
                    return
                }
            }
        }
        
        return nil
    }
}
