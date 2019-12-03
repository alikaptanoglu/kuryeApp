//
//  CustomButton.swift
//  kuryeApp
//
//  Created by burgan on 2.12.2019.
//  Copyright © 2019 burgan. All rights reserved.
//

import UIKit

@IBDesignable
final class CustomButton: UIButton {
    
    @IBOutlet weak var btnImageView: UIImageView!
    @IBOutlet weak var btnLabel: UILabel!
    
    
    var borderWidth: CGFloat = 2.0
    var borderColor = UIColor.white.cgColor
    @IBInspectable var titleText: String? {
        didSet {
            self.setTitle(titleText, for: .normal)
            self.setTitleColor(UIColor.black,for: .normal)
        }
    }
 @IBInspectable var image: UIImage? {
     get {
         return btnImageView.image
     } set(image) {
         btnImageView.image = image
     }
 }
    override init(frame: CGRect){
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
 
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setup()
    }
    
    func setup() {
//        let blue = UIColor(hex: "#3d8af7")
        
        self.clipsToBounds = true
        self.layer.cornerRadius = self.frame.size.width / 2.0
        self.layer.borderColor = borderColor
        self.layer.borderWidth = borderWidth
//        self.layer.backgroundColor = blue as! CGColor
        
        
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
