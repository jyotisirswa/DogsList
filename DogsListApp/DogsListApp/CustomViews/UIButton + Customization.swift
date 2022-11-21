//
//  RoundButton.swift
//  DogsListApp
//
//  Created by Jyoti on 21/11/2022.
//

import Foundation
import UIKit

@IBDesignable class RoundButton: UIButton {
    
    @IBInspectable var cornerRadius: CGFloat = 15 {
        didSet {
            refreshCR(_value: cornerRadius)
        }
    }
    
    @IBInspectable var borderColor: UIColor = .clear { didSet { self.layer.borderColor = self.borderColor.cgColor } }
    @IBInspectable var borderWidth: CGFloat = 0.00 { didSet { self.layer.borderWidth = self.borderWidth } }
    
    
    func refreshCR(_value: CGFloat) {
        layer.cornerRadius = _value
    }
    
    
    @IBInspectable var customBGColor: UIColor = UIColor.init(red: 0, green: 122/255, blue: 255/255, alpha: 1) {
        didSet {
            refreshColor(_color: customBGColor)
        }
    }
    
    func refreshColor(_color: UIColor) {
        //print("refreshColor(): \(_color)")
        let size: CGSize = CGSize(width: 1, height: 1)
        UIGraphicsBeginImageContextWithOptions(size, true, 0.0)
        _color.setFill()
        UIRectFill(CGRect(x: 0, y: 0, width: size.width, height: size.height))
        let bgImage: UIImage = UIGraphicsGetImageFromCurrentImageContext() as UIImage? ?? UIImage()
        UIGraphicsEndImageContext()
        setBackgroundImage(bgImage, for: .normal)
        clipsToBounds = true
    }
    
    override init(frame: CGRect) {
        //print("init(frame:)")
        super.init(frame: frame);
        
        sharedInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        //print("init?(coder:)")
        super.init(coder: aDecoder)
        
        sharedInit()
    }
    
    override func prepareForInterfaceBuilder() {
        //print("prepareForInterfaceBuilder()")
        sharedInit()
    }
    
    func sharedInit() {
        refreshCR(_value: cornerRadius)
        refreshColor(_color: customBGColor)
        self.tintColor = UIColor.white
    }
}
