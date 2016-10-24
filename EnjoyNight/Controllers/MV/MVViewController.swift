//
//  MVViewController.swift
//  EnjoyNight
//
//  Created by sword on 16/7/29.
//  Copyright © 2016年 Chow-Chow. All rights reserved.
//

import UIKit

class MVViewController: RootViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var collectionView : UICollectionView?
    
    var MVImageArray = NSArray()
    
    var MVTypeArray = NSArray()
    
    var MVUrlArray = NSArray()
    
    var cyclePlaying = Carousel()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.titleLabel?.text = "悦听"
        
        createUI()
        initData()

    }
    //MARK:initData
    func initData() {
        self.MVTypeArray = ["首播","内地","港台","欧美","日语","韩国"]
        
        self.MVImageArray = ["shili0","shili2","shili8","shili10","shili13","shili19"]
        
        self.MVUrlArray = [firstMVUrl, mainLandUrl,hktwUrl, westernUrl, japanUrl, koreanUrl]
        
        
    }
    //MARK:UI
    func createUI() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .Vertical
        
        self.collectionView = UICollectionView(frame: CGRectMake(10 , 100, screenWidth - 20, screenHeight), collectionViewLayout: layout)
        
        self.collectionView!.delegate = self
        self.collectionView!.dataSource = self
        
        self.collectionView!.backgroundColor = UIColor.whiteColor()
        
        self.view.addSubview(self.collectionView!)
        
        //轮播
        self.cyclePlaying = Carousel(frame: CGRectMake(0, 0, screenWidth, 90))
        self.cyclePlaying.needPageControl = true
        self.cyclePlaying.infiniteLoop = true
        self.cyclePlaying.pageControlPositionType = PAGE_CONTROL_POSITION_TYPE_MIDDLE
        self.cyclePlaying.imageArray = ["shili0","shili2","shili8","shili10","shili13","shili19"]
        //self.collectionView?.addSubview(cyclePlaying)
        self.view.addSubview(self.cyclePlaying)
        
        self.collectionView!.registerNib(UINib(nibName: "MVTypeCell", bundle: nil), forCellWithReuseIdentifier: "myTypeCell")
        
    }
    
    //MARK:collectionView 的代理方法
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.MVTypeArray.count 
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = self.collectionView!.dequeueReusableCellWithReuseIdentifier("myTypeCell", forIndexPath: indexPath) as! MVTypeCell
        
        cell.mainImageView.image = UIImage(named: self.MVImageArray[indexPath.row] as! String)
        cell.backgroundColor = UIColor.greenColor()
        
        cell.typeNameLabel.text = self.MVTypeArray[indexPath.row] as! String
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSizeMake((screenWidth - 30) / 2, 150)
        
    }
   
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let mvListVC = MVListViewController()
        
        mvListVC.mvUrl = self.MVUrlArray[indexPath.row] as! String
        
        mvListVC.typeName = self.MVTypeArray[indexPath.row] as! String
        
        self.navigationController?.pushViewController(mvListVC, animated: true)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    

}
