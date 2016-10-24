//
//  MyTabBarViewController.swift
//  EnjoyNight
//
//  Created by sword on 16/7/29.
//  Copyright © 2016年 Chow-Chow. All rights reserved.
//

import UIKit

class MyTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
      
        let heatVC = HeatViewController()
        let heatNav = UINavigationController(rootViewController: heatVC)
        
        let readVC = ReadViewController()
        let readNav = UINavigationController(rootViewController: readVC)
        
        let mVVC = MVViewController()
        let mVNav  = UINavigationController(rootViewController: mVVC)
        
        let myVC = MyViewController()
        let myNav = UINavigationController(rootViewController: myVC )
        let navArray = [heatNav, readNav, mVNav, myNav]
        self.viewControllers = navArray
    
        let titleArray = ["悦看","悦读","悦听","我的"]
        
        let unSelectedImageArray = ["sheying_Sel.png","chongwu_Sel.png","mv_Sel.png","my_Sel.png"]
        
        let selectedImageArray = ["sheying_Nor.png","chongwu_Nor","mv_Nor","my_Nor"]
        
        for i in 0..<navArray.count {
            
            let nav = navArray[i]
            nav.tabBarItem.title = titleArray[i]
        
            let unselectedImage = UIImage(named: unSelectedImageArray[i])
            nav.tabBarItem.image = unselectedImage?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal)
            
            let seletedImage = UIImage(named: selectedImageArray[i])
            nav.tabBarItem.image = seletedImage?.imageWithRenderingMode(.AlwaysOriginal)
            
            
        }
        UITabBarItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.RGBA(167, 122, 250), NSFontAttributeName: UIFont.systemFontOfSize(20)], forState: .Selected)
        UITabBarItem.appearance().setTitleTextAttributes([NSFontAttributeName:UIFont.systemFontOfSize(12)], forState: .Normal)
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    

    
}
