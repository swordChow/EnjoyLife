//
//  MVListViewController.swift
//  EnjoyNight
//
//  Created by sword on 16/7/30.
//  Copyright © 2016年 Chow-Chow. All rights reserved.
//

import UIKit

class MVListViewController: RootViewController, UITableViewDelegate, UITableViewDataSource {
    
    var tableView = UITableView()
    
    var dataArray = NSMutableArray()
    
    var mvUrl: String!
    
    var size = 40
    
    var typeName: String!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createNav()
        
        createUI()
        
        createRefresh()
    }
    
    //MARK:refresh
    
    func createRefresh() {
        self.tableView.header = MJRefreshNormalHeader(refreshingBlock: {
            self.size = 40
            self.dataArray.removeAllObjects()
            self.getData()
        })
        
        self.tableView.footer = MJRefreshAutoNormalFooter(refreshingBlock: {
            self.dataArray.removeAllObjects()
            self.size += 40
            self.getData()
        })
        
        
        self.tableView.header.beginRefreshing()
        self.tableView.reloadData()
        self.tableView.registerNib(UINib(nibName: "MVCell", bundle: nil ), forCellReuseIdentifier: "mvCell")
        
    }
    
    func getData() {
        let manager = AFHTTPSessionManager()
        let dic = ["size":self.size]
        manager.GET(self.mvUrl, parameters: dic, success: { (dataTask: NSURLSessionDataTask?, responseObject: AnyObject?) in
           
            
            let videoArray = responseObject?.objectForKey("videos") as! NSArray
            
            for i in 0..<videoArray.count {
                let model = MVModel()
                let dic = videoArray[i] as! [String: AnyObject]
                model.setValuesForKeysWithDictionary(dic)
                
                self.dataArray.addObject(model)
                
            }
            
            print(self.dataArray.count)
            if self.size == 40 {
                self.tableView.header.endRefreshing()
            }
            else {
                self.tableView.header.endRefreshing()
            }
            
            self.tableView.reloadData()
            
            
        }) { (dataTask: NSURLSessionDataTask?, error:ErrorType?) in
            
        }
        
        
    }
    //MARK:UI
    func createUI() {
        
        self.tableView = UITableView(frame: CGRectMake(0, 0, screenWidth, screenHeight), style: .Plain)
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.backgroundColor = UIColor.whiteColor()
        self.tableView.rowHeight = 140
        
        self.view.addSubview(self.tableView)
        
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "mvCell")
        
        
        
        
    }
    
    
    //MARK:Nav
    func createNav() {
        self.titleLabel?.text = typeName
        self.leftButton?.setImage(UIImage(named: "back.png"), forState: .Normal)
        self.addLeftButtonTarget(#selector(MVListViewController.backToMVVC))
        
    }
    func backToMVVC() {
        self.navigationController?.popViewControllerAnimated(true)
        
        
    }
    //MARK:tableView代理
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCellWithIdentifier("mvCell", forIndexPath: indexPath) as! MVCell
        if self.dataArray.count > 0 {
        let model = self.dataArray[indexPath.row]
        cell.model = model as! MVModel
        }
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 140
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let mvDetailVC = MVDetailViewController()
        
        let model = self.dataArray[indexPath.row]
        
        mvDetailVC.model = model as! MVModel
        mvDetailVC.hidesBottomBarWhenPushed = true
        
        self.navigationController?.pushViewController(mvDetailVC, animated: true)
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
}
