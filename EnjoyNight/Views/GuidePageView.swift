//
//  GuidePageView.swift
//  EnjoyNight
//
//  Created by sword on 16/7/29.
//  Copyright © 2016年 Chow-Chow. All rights reserved.
//

import UIKit

class GuidePageView: UIView {
    
    var scrollView: UIScrollView?
    
    var goInButton: UIButton?
    init(frame: CGRect, imageArray: NSArray) {
        super.init(frame: frame)
        self.scrollView = UIScrollView(frame: CGRectMake(0, 0, screenWidth, screenHeight + 64))
        
        self.scrollView?.pagingEnabled = true
        
        self.scrollView?.showsHorizontalScrollIndicator = false
        
        self.scrollView?.bounces = false
        
        self.scrollView?.contentSize = CGSizeMake(CGFloat(imageArray.count) * screenWidth, screenHeight + 64)
        self.addSubview(self.scrollView!)
        
        for i in 0..<imageArray.count {
            
            let imageView = Factory.createImageViewWith(CGRectMake(CGFloat(i) * screenWidth, 0, screenWidth, screenHeight + 64), imageName: imageArray[i] as! String)
            
            imageView.userInteractionEnabled = true
            
            self.scrollView?.addSubview(imageView)
            
            if i == imageArray.count - 1 {
                
                goInButton = Factory.createButtonWith(CGRectMake(screenWidth / 2 - 50, screenHeight - 160, 100, 60), type: .Custom, title: "进入应用", titleColor: UIColor.redColor(), imageName: "", target: nil , action: "", backGroudImageName: "")
                
                
                imageView.addSubview(self.goInButton!)
            }
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    

}
