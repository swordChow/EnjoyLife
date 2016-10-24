//
//  PicDetailViewController.swift
//  EnjoyNight
//
//  Created by sword on 16/8/2.
//  Copyright © 2016年 Chow-Chow. All rights reserved.
//

import UIKit

class PicDetailViewController: RootViewController, UITableViewDelegate, UITableViewDataSource {
    
    var picUrl: String?
    var picTitle: String?
    
    var tableView = UITableView()
    
    var dataArray = NSMutableArray()

    var displayView = DisplayPictureView()

    override func viewDidLoad() {
        
        super.viewDidLoad()
        createNav()
        createUI()
        getData()
        
    }
    //MARK:getData
    
    func getData() {
        let manager = AFHTTPSessionManager()
        manager.responseSerializer.acceptableContentTypes = NSSet(object:"text/html")  as! Set<String>
        manager.GET(picUrl, parameters: nil, success: { (dataTask:NSURLSessionDataTask?, responseObject:AnyObject?) in
            
            if let array = responseObject as? NSArray {
                for i in 0..<array.count {
                    let model = APicMoel()
                    let dic = array[i] as![String: AnyObject]
                    model.date = dic["date"] as! String
                    let subDic = dic["pic"] as! [String: AnyObject]
                    model.gq = subDic["gq"] as! String
                    model.pic_datil = subDic["pic_datil"] as!String
                    
                    self.dataArray.addObject(model)
                }
            }
            
            
           //self.tableView.header.endRefreshing()
            self.tableView.reloadData()
        }) { (dataTask:NSURLSessionDataTask?, error:ErrorType?) in
                print(error)
        }
        
        
        
    }
    
    
    
    //MARK:UI
    func createUI() {
        self.tableView = UITableView(frame: CGRectMake(0, 0, screenWidth, screenHeight), style: .Plain)
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.backgroundColor = UIColor.lightGrayColor()
        self.view.addSubview(self.tableView)
        
        self.tableView.registerNib(UINib(nibName: "APicCell", bundle: nil), forCellReuseIdentifier: "aPicCell")
        
    }
    //MARK:Nav
    func createNav() {
        self.titleLabel?.text = picTitle!
        self.titleLabel?.lineBreakMode = .ByTruncatingMiddle
        self.leftButton?.setImage(UIImage(named: "back.png"), forState: .Normal)
        self.addLeftButtonTarget(#selector(self.backToPic))
        self.view.backgroundColor = UIColor.greenColor()
        

        
    }
    func backToPic() {
        
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    //tableview代理方法
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCellWithIdentifier("aPicCell", forIndexPath: indexPath) as! APicCell
        let model = self.dataArray[indexPath.row] as! APicMoel
        
        cell.model = model
        
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        return 350
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let model = self.dataArray[indexPath.row]
        
        displayView = DisplayPictureView(frame: CGRectMake(0, 0, screenWidth, screenHeight + 64), url: model.gq!!)
        
        self.view.addSubview(self.displayView)
        
        displayView.disMissBtn.addTarget(self, action: #selector(self.removeDisplayView), forControlEvents: .TouchUpInside)
        
        
        
    }
    func removeDisplayView() {
        
        self.displayView.removeFromSuperview()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

   
}
