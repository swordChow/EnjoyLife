//
//  HeatViewController.swift
//  EnjoyNight
//
//  Created by sword on 16/7/29.
//  Copyright © 2016年 Chow-Chow. All rights reserved.
//

import UIKit

class HeatViewController: RootViewController ,UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource{
    
    var titleArray = ["风光","人像","生态","建筑","宠物","生活"]
    
    var buttonArray = NSMutableArray()
    
    var dataArray = NSMutableArray()
    
    var lineView = UIView()
    
    var collectionView : UICollectionView?
    
    var fid = "125"
    
    var page = 1
    
    var titleUrl  = "风光"
    
    var selectedIndex = 0
    /**
     http://api.fengniao.com/app_ipad/pic_bbs_list_v2.php?appImei=99000505856649&osType=Android&osVersion=4.1.1
     fid 125 101 16 165 30 115
     page 1
     */

    override func viewDidLoad() {
        super.viewDidLoad()
        self.titleLabel?.text = "悦赏"
        createHeaderView()
        
        createUI()
        
        createRefresh()
        
        for i in 0..<self.buttonArray.count {
            let btn = self.buttonArray[i] as! UIButton
            if btn == self.buttonArray.firstObject as! UIButton {
                
                btn.selected = true
            }
        }

        
    }
    
    
    
    //MARK:refresh and get Data
    func createRefresh() {
        
        self.collectionView?.header = MJRefreshNormalHeader(refreshingBlock: {
            
            self.dataArray.removeAllObjects()
            self.page = 1
            self.getData()
            
        })
        
        self.collectionView?.footer = MJRefreshAutoNormalFooter(refreshingBlock: { 
            self.page += 1
            self.getData()
        })
        
        self.collectionView?.header.beginRefreshing()
        
    }
    func getData() {
        
        
        let manager = AFHTTPSessionManager()
        
        manager.responseSerializer.acceptableContentTypes = NSSet(object: "text/html") as! Set<String>
        
        let dic = ["appImei": "99000505856649","osType":"Android","osVersion":"4.1.1","fid":self.fid,"page":self.page]
        
        manager.GET("http://api.fengniao.com/app_ipad/pic_bbs_list_v2.php/", parameters: dic, success: { (dataTask:NSURLSessionDataTask?, responseObject: AnyObject?) in
            
            
           
            
            let array = responseObject?.objectForKey("list") as! NSArray
            
           
            for i in 0..<array.count {
                let model = PicModel()
                let obj = array[i] as! [String: AnyObject]
                model.setValuesForKeysWithDictionary(obj)
                self.dataArray.addObject(model)
            }
            
            if self.page == 1{
                self.collectionView?.header.endRefreshing()
            }
            else{
                self.collectionView?.footer.endRefreshing()
            }
            
           // self.collectionView?.collectionViewLayout.invalidateLayout()
            
            self.collectionView?.reloadData()
            
        }) { (dataTask:NSURLSessionDataTask?, error:ErrorType?) in
            print(error)
            
        }
        
    }
    
    
    //MARK:createUI
    
    func createUI() {
        
        let flowLayout = UICollectionViewFlowLayout()
        
        flowLayout.scrollDirection = .Vertical
        
        flowLayout.minimumInteritemSpacing = 10.0
        
        flowLayout.minimumLineSpacing = 10.0
        
        
        
        self.collectionView = UICollectionView(frame: CGRectMake(0, 40, screenWidth, screenHeight - 40), collectionViewLayout: flowLayout)
        
        
        
        self.collectionView?.backgroundColor = UIColor.whiteColor()
        
        self.collectionView?.delegate = self
        
        self.collectionView?.dataSource = self
        
        self.view.addSubview(self.collectionView!)
        
         self.collectionView?.registerNib(UINib(nibName: "PicCell",bundle: nil), forCellWithReuseIdentifier: "picCell")
        
    }
    
    //MARK:cteateHeaderView
    
    func createHeaderView() {
        for i in 0..<self.titleArray.count {
            
            let btn = UIButton(type: .Custom)
            
            btn.frame = CGRectMake(CGFloat(i) * screenWidth / 6, 0, screenWidth / 6, 30)
            btn.setTitle(self.titleArray[i], forState: .Normal)
            btn.setTitleColor(UIColor.lightGrayColor(), forState: .Normal)
            btn.setTitleColor(UIColor.RGBA(171, 122, 250), forState: .Selected)
            btn.tag = 200 + i
            btn.addTarget(self, action: #selector(choosePicTypeBtnClicked(_ :)), forControlEvents: .TouchUpInside)
            self.view.addSubview(btn)
            
            self.buttonArray.addObject(btn)
            
        }
        self.lineView = UIView(frame: CGRectMake(0, 38, screenWidth / 6, 2))
        self.lineView.backgroundColor = UIColor.RGBA(171, 122, 250)
        self.view.addSubview(self.lineView)
        
        
    }
    
    //MARK:changeType
    func choosePicTypeBtnClicked(sender: UIButton) {
        
        for button in self.buttonArray {
            let btn = button as! UIButton
            btn.selected = false
        }
//        if  sender.tag - 200 != self.selectedIndex  {
//           self.dataArray.removeAllObjects()
//            self.collectionView?.collectionViewLayout.invalidateLayout()
//        }
        
        sender.selected = true
        self.selectedIndex = sender.tag - 200
        self.lineView.frame = CGRectMake(CGFloat(sender.tag - 200) * screenWidth / 6, 38, screenWidth / 6, 2)
        //choose picture type
        switch selectedIndex {
        case 0:
            self.fid = "125"
            self.titleUrl = "风光"
        case 1:
            self.fid = "101"
            self.titleUrl = "人像"
            
        case 2:
            self.fid = "16"
            self.titleUrl = "生态"
        case 3:
            self.fid = "165"
            self.titleUrl = "建筑"
        case 4:
            self.fid = "30"
            self.titleUrl = "宠物"
        case 5:
            self.fid = "115"
            self.titleUrl = "生活"
        default: return
        }
        self.page = 1
        //self.collectionView?.collectionViewLayout.invalidateLayout()
        self.collectionView?.header.beginRefreshing()
        
        
    }
    
    //MARK:collectionView代理方法
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return  self.dataArray.count
    }
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
         let cell = self.collectionView!.dequeueReusableCellWithReuseIdentifier("picCell", forIndexPath: indexPath) as! PicCell
        if self.dataArray.count > 0 {
           
            let model = self.dataArray[indexPath.item] as! PicModel
        
            cell.model = model
        }
        
        
        return cell
        
    }
    
    func collectionView(collectionView: UICollectionView!, waterFlowLayout layout: NBWaterFlowLayout!, heightForItemAtIndexPath indexPath: NSIndexPath!) -> CGFloat {
        return  180
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSizeMake((screenWidth - 30) / 2, 180)
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
      
        return UIEdgeInsetsMake(10, 10, 10, 10)
        
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        let picDetailVC = PicDetailViewController()
        
        let model  = self.dataArray[indexPath.item] as! PicModel
        
        picDetailVC.picUrl = model.detail_url
        
        picDetailVC.picTitle = model.title
        
        picDetailVC.hidesBottomBarWhenPushed =  true
        
        
        self.navigationController?.pushViewController(picDetailVC, animated: true)
    }
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

   
}
