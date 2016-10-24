//
//  RootViewController.swift
//  EnjoyNight
//
//  Created by sword on 16/7/29.
//  Copyright © 2016年 Chow-Chow. All rights reserved.
//

import UIKit

class RootViewController: UIViewController {
    
    var titleLabel: UILabel?
    
    var leftButton: UIButton?
    
    var rightButton: UIButton?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.whiteColor()
        
        self.navigationController?.navigationBar.translucent = false
        self.navigationController?.navigationBar.barTintColor = UIColor.RGBA(171, 122, 250)
        
        self.titleLabel = Factory.createLabelWith(CGRectMake(0, 0, 100, 44), text: "", font: UIFont.systemFontOfSize(20), textAlignment: .Center, textColor: UIColor.whiteColor())
        self.navigationItem.titleView = self.titleLabel
        
        self.leftButton = Factory.createButtonWith(CGRectMake(0, 0, 44, 44), type: .Custom, title: "", titleColor: UIColor.whiteColor(), imageName: "", target: nil, action: "", backGroudImageName: "")
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: leftButton!)
        self.rightButton = Factory.createButtonWith(CGRectMake(0, 0, 44, 44), type: .Custom, title: "", titleColor: UIColor.whiteColor(), imageName: "", target: nil, action: "", backGroudImageName: "")
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: rightButton!)
        

       
    }
    //按钮响应事件
    func addLeftButtonTarget(selector: Selector) {
        
        self.leftButton?.addTarget(self, action: selector, forControlEvents: .TouchUpInside)
        
        
    }
    
    func addRightButtonTarget(selector: Selector) {
        
        self.rightButton?.addTarget(self, action: selector, forControlEvents: .TouchUpInside)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    
}
