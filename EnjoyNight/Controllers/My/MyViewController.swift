//
//  MyViewController.swift
//  EnjoyNight
//
//  Created by sword on 16/7/29.
//  Copyright © 2016年 Chow-Chow. All rights reserved.
//

import UIKit

class MyViewController: RootViewController , UITableViewDelegate, UITableViewDataSource{
    
    var tableView = UITableView()
    
    var headerImageView = UIImageView()
    
    var imageOriginalHeight: CGFloat = 200.0
    
    var imageArray = NSArray()
    
    var titleArray = NSArray()
    
    var darkView = UIView()
    
    var appIconBadgeNumber = 0
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.brownColor()
        
        self.titleLabel?.text = "我的"

        self.imageArray = ["","","","",""]
        self.titleArray = ["我的收藏","清理缓存","夜间模式","推送消息","关于"]
        createUI()
        
        
       
    }
    
    func createUI() {
        
        self.tableView = UITableView(frame: CGRectMake(0, 0, screenWidth, screenHeight), style: .Plain)
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.view.addSubview(self.tableView)
        
        self.tableView.tableFooterView = UIView()
        
        self.tableView.separatorColor = UIColor.RGBA(171, 122, 250)
        
        self.headerImageView = Factory.createImageViewWith(CGRectMake(0, -imageOriginalHeight, screenWidth, imageOriginalHeight), imageName: "welcome5.png")
        self.tableView.addSubview(headerImageView)
        
        self.tableView.contentInset = UIEdgeInsetsMake(imageOriginalHeight, 0, 0, 0)
        
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "myCell")
        
        self.darkView = UIView(frame: self.view.bounds)
        
        
    }
    //MARK:tableview 代理方法
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.titleArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("myCell", forIndexPath: indexPath)
        if indexPath.row == 0 || indexPath.row == 1 || indexPath.row == 4 {
            cell.accessoryType = .DisclosureIndicator
        }
        else {
            let swi = UISwitch(frame: CGRectMake(screenWidth - 70, 5, 60, 34))
            swi.tag = indexPath.row + 200
            
            cell.addSubview(swi)
            
            swi.addTarget(self, action: "changeValue:", forControlEvents: .ValueChanged)
            
        }
        cell.imageView?.image = UIImage(named: self.imageArray[indexPath.row] as! String)
        
        cell.textLabel?.text = self.titleArray[indexPath.row] as!String
        
        
        
        
        return cell
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        
        if scrollView == self.tableView {
            
            let yOffset = scrollView.contentOffset.y
            let xOffset = (imageOriginalHeight + yOffset) / 2
            
            if yOffset < -imageOriginalHeight {
                var rect = self.headerImageView.frame
                
                rect.origin.y = yOffset
                rect.size.height = -yOffset
                
                rect.origin.x = xOffset
                
                rect.size.width = screenWidth + fabs(xOffset) * 2
                
                self.headerImageView.frame = rect
                
            }
        }
        
    }

    
    func changeValue(sender: UISwitch) {
        
        if sender.tag == 202 {
            if sender.on {
                self.darkView.userInteractionEnabled = false
                self.darkView.backgroundColor = UIColor(white: 0, alpha: 0.2)
                let app = UIApplication.sharedApplication()
                
                let delegate = app.delegate as! AppDelegate
                delegate.window?.addSubview(self.darkView)
                
            }
            else {
                self.darkView.removeFromSuperview()
            }
        }
        if sender.tag == 203 {
            if sender.on {
                
                self.createLocalNotification()
            }
            else {
                
                self.cancelLocalNotification()
                
            }
        }
    }
    //MARK:create and cancel LocalNotification
    
    func createLocalNotification() {
        
        self.appIconBadgeNumber += 1
        
        let localNotification = UILocalNotification()
        
        localNotification.fireDate = NSDate(timeIntervalSinceNow: 10)
        
        localNotification.timeZone = NSTimeZone.defaultTimeZone()
        
        localNotification.repeatInterval = NSCalendarUnit.Day
        
        localNotification.alertTitle = "悦享"
        
        localNotification.alertBody = "工作忙了一天了，来一场视觉听觉盛宴，好好放松一下吧"
        localNotification.soundName = "msg.caf"
        
        localNotification.applicationIconBadgeNumber = self.appIconBadgeNumber
        
        UIApplication.sharedApplication().scheduleLocalNotification(localNotification)
        
    }
    
    func cancelLocalNotification() {
        
        let array = UIApplication.sharedApplication().scheduledLocalNotifications
        
        for i in 0..<array!.count {
            
            let noti = array![i]
            
            if noti.alertBody == "工作忙了一天了，来一场视觉听觉盛宴，好好放松一下吧" {
                UIApplication.sharedApplication().cancelLocalNotification(noti)
                self.appIconBadgeNumber -= 1
                
                UIApplication.sharedApplication().applicationIconBadgeNumber = self.appIconBadgeNumber
            }
        }
        
        
        
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
}
