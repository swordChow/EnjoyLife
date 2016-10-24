//
//  ReadViewController.swift
//  EnjoyNight
//
//  Created by sword on 16/7/29.
//  Copyright © 2016年 Chow-Chow. All rights reserved.
//

import UIKit

class ReadViewController: RootViewController, UITableViewDelegate, UITableViewDataSource {
    
    var dataArray =  NSMutableArray()
    
    var page = 0
    
    let  maxNum = 20
    
    var tableView = UITableView()
    
    var hud = MBProgressHUD()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.titleLabel?.text = "悦读"
        
        createUI()
        createRefresh()
        
    }
    //MARK:刷新取数据
    
    func createRefresh() {
        self.tableView.header = MJRefreshNormalHeader(refreshingBlock: { 
            self.page = 0
            self.dataArray.removeAllObjects()
            self.getData()
        })
        
        self.tableView.footer = MJRefreshAutoNormalFooter(refreshingBlock: { 
            self.page += 1
            self.getData()
        })
        
        self.tableView.header.beginRefreshing()
        
        
    }
    
    func getData() {
        let dic = ["num" : self.maxNum,"rand" : 1, "page": self.page]
        let manager = AFHTTPSessionManager()
        manager.requestSerializer.setValue("85b2b97a03ed00603b49faf61cb02ee4", forHTTPHeaderField: "apikey")
        manager.GET("http://apis.baidu.com/txapi/weixin/wxhot", parameters: dic, success: { (dataMask: NSURLSessionDataTask?, responseObject: AnyObject?) in
            //print(responseObject)
            
            let array = responseObject?.objectForKey("newslist") as! NSArray
            
            for i in 0..<array.count {
                
                let dic = array[i] as! [String: AnyObject]
                let model = ReadModel()
                model.setValuesForKeysWithDictionary(dic)
                self.dataArray.addObject(model)
            }
            if self.page == 0 {
                self.tableView.header.endRefreshing()
            }
            else {
                self.tableView.footer.endRefreshing()
            }
            self.tableView.reloadData()
            
        }) { (dataMask: NSURLSessionDataTask?, error: ErrorType?) in
                print(error)
        }
        
        
    }
    //MARK:UI
    func createUI() {
        
        self.tableView = UITableView(frame: CGRectMake(0, 0, screenWidth, screenHeight), style: .Plain)
        self.tableView.delegate = self
        
        self.tableView.dataSource = self
        
        self.tableView.rowHeight = 120
        
        self.view.addSubview(self.tableView)
        
        //self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "readCell")
        self.tableView.registerNib(UINib(nibName: "ReadCell",bundle: nil), forCellReuseIdentifier: "readCell")
        
    }
    
    
    
    
    
    
    //MARK:tableView代理方法
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCellWithIdentifier("readCell", forIndexPath: indexPath) as! ReadCell
        
        let model = self.dataArray[indexPath.row]
        cell.model = model as! ReadModel
        
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let readArticleVC = ReadArticleViewController()
        readArticleVC.model  = self.dataArray[indexPath.row] as! ReadModel
        
        readArticleVC.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(readArticleVC, animated: true)
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
}
