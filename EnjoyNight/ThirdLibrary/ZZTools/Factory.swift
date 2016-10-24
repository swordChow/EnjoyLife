//
//  Factory.swift
//  EnjoyNight
//
//  Created by sword on 16/7/29.
//  Copyright © 2016年 Chow-Chow. All rights reserved.
//

import UIKit

class Factory: NSObject {
    
    static func createViewWith(frame: CGRect) -> UIView {
        let view = UIView(frame: frame)
        return view
    }
    
    static func createLabelWith(frame: CGRect, text: String, font: UIFont, textAlignment: NSTextAlignment, textColor: UIColor) -> UILabel {
        
        let label = UILabel(frame: frame)
        label.text = text
        label.font = font
        label.textAlignment = textAlignment
        label.textColor = textColor
        
        return label
    }
    
    static func createButtonWith(frame: CGRect, type: UIButtonType, title: String, titleColor: UIColor, imageName: String, target: AnyObject?, action: Selector, backGroudImageName: String) -> UIButton {
        
        let btn = UIButton(type: type)
        
        btn.frame = frame
        btn.setTitle(title, forState: .Normal)
        btn.setTitleColor(titleColor, forState: .Normal)
        
        btn.setImage(UIImage(named: imageName), forState: .Normal)
        btn.setBackgroundImage(UIImage(named: backGroudImageName), forState: .Normal)
        
        btn.addTarget(target, action: action, forControlEvents: .TouchUpInside)
        
        return btn
        
    }
    
    static func createImageViewWith(frame: CGRect, imageName: String) -> UIImageView {
        
        let imageView = UIImageView(frame: frame)
        imageView.image = UIImage(named: imageName)
        
        return imageView
        
        
    }
    
    static func createTextFieldWith(frame: CGRect, text: String, placeHolder: String) -> UITextField {
        
        let textField = UITextField(frame: frame)
        textField.text = text
        textField.placeholder = placeHolder
        
        return textField
    }
    
    

}
