//
//  DisplayPictureView.swift
//  EnjoyNight
//
//  Created by sword on 16/8/2.
//  Copyright © 2016年 Chow-Chow. All rights reserved.
//

import UIKit

class DisplayPictureView: UIView {

    var picImageView = UIImageView()
    
    var disMissBtn = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    init(frame: CGRect, url: String) {
        super.init(frame: frame)
        self.backgroundColor = UIColor(white: 0.0, alpha: 0.8)
        self.picImageView = UIImageView(frame: CGRectMake(0, (screenHeight + 64) / 4, screenWidth, (screenHeight + 64) / 2))
        self.picImageView.sd_setImageWithURL(NSURL(string: url), placeholderImage: UIImage(named: "placeholder.jpg"))
        self.addSubview(self.picImageView)
        self.disMissBtn = UIButton(type: .Custom)
        self.disMissBtn.frame = CGRectMake(0, 64, 44, 44)
        self.disMissBtn.setImage(UIImage(named: "cancel.png"), forState: .Normal)
       self.picImageView.userInteractionEnabled = true
       self.addSubview(disMissBtn)
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
