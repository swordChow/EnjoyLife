//
//  AppDelegate.swift
//  EnjoyNight
//
//  Created by sword on 16/7/29.
//  Copyright © 2016年 Chow-Chow. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    var myTabVC : UITabBarController?
    
    var guidePageView: GuidePageView?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        
        self.myTabVC = MyTabBarViewController()
        
        self.window?.rootViewController = self.myTabVC
        
        UIApplication.sharedApplication().statusBarStyle = .LightContent
        
        createGuidePage()
        
        let systemVersion = (UIDevice.currentDevice().systemVersion as NSString).floatValue
        if systemVersion >= 8.0 {
            let type: UIUserNotificationType?
            let alert = UIUserNotificationType.Alert.rawValue
            let sound = UIUserNotificationType.Sound.rawValue
            let badge = UIUserNotificationType.Badge.rawValue
            
            type = UIUserNotificationType(rawValue: alert|sound|badge)
            
            let settings = UIUserNotificationSettings(forTypes: type!, categories: nil)
            
            UIApplication.sharedApplication().registerUserNotificationSettings(settings)
        }
        
        //注册友盟
        UMSocialData.setAppKey("57a1a5dc67e58e9a9e003087")
        
        UMSocialConfig.hiddenNotInstallPlatforms([UMShareToQQ, UMShareToQzone, UMShareToWechatSession, UMShareToWechatTimeline])
        return true
    }
    
    func createGuidePage() {
        
        let isRun = NSUserDefaults.standardUserDefaults().objectForKey("isRun")
        if isRun != nil {
            return
        }
        
        let imageArray = ["welcome2.png","welcome4.png","welcome6.png","welcome7.png"]
        self.guidePageView = GuidePageView(frame: self.window!.bounds, imageArray: imageArray)
        self.myTabVC?.view.addSubview(self.guidePageView!)
        
        
        NSUserDefaults.standardUserDefaults().setObject("first", forKey: "isRun")

        self.guidePageView?.goInButton?.addTarget(self, action: "comeIntoApp", forControlEvents: .TouchUpInside)
        
    }
    
    func comeIntoApp() {
        self.guidePageView?.removeFromSuperview()
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        
        let myVC = MyViewController()
        myVC.appIconBadgeNumber = 0
        UIApplication.sharedApplication().applicationIconBadgeNumber = myVC.appIconBadgeNumber
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

