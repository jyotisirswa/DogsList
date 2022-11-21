//
//  UIViews + Extension.swift
//  DogsListApp
//
//  Created by Jyoti on 21/11/2022.
//

import Foundation
import UIKit

//MARK: - UILABEL + CUSTOMIZATION
extension UILabel {
    func changeColor(textObj : String) {
        guard let text = self.text else {
            return
        }
        let attributeString =  NSMutableAttributedString(string: text)
        attributeString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.black, range: NSRange(location:text.count - textObj.count, length: textObj.count))
      //  attributeString.addAttributes([NSAttributedString.Key.font:UIFont.systemFont(ofSize: 14)], range: NSRange(location:text.count - 3,length:text.count - (text.count - 3)))
        self.attributedText = attributeString
    }
}


