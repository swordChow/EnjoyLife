//
//  MVDetailViewController.swift
//  EnjoyNight
//
//  Created by sword on 16/7/31.
//  Copyright © 2016年 Chow-Chow. All rights reserved.
//

import UIKit

import AVKit
import AVFoundation

protocol playVideo: class  {
    func playVideoWith(videoUrl: String)
}

class MVDetailViewController: RootViewController, UITableViewDelegate, UITableViewDataSource , playVideo{
    
    var model : MVModel!
    
    var tableView = UITableView()
    
    var headerImageView = UIImageView()
    
    var playBtn: UIButton!
    
    var imageOriginalHeight : CGFloat = 300
    
    var avPlayer : AVPlayerViewController?
    
    //weak var delegate: playVideo?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createNav()
        
        createUI()
        
    }
    //MARK:UI
    func createUI() {
        
        self.tableView = UITableView(frame: CGRectMake(0, 0, screenWidth, screenHeight), style: .Plain)
        self.tableView.delegate = self
        
        self.tableView.dataSource = self
        
        self.tableView.tableFooterView = UIView()
        
        self.view.addSubview(self.tableView)
        
        self.headerImageView = UIImageView(frame: CGRectMake(0, -imageOriginalHeight, screenWidth, imageOriginalHeight))
        self.headerImageView.sd_setImageWithURL(NSURL(string: model.albumImg!), placeholderImage: UIImage(named: "placeholder.jpg"))
        self.headerImageView.userInteractionEnabled = true
        self.tableView.addSubview(headerImageView)
        
        self.playBtn = UIButton(type: .Custom)
        
        self.playBtn.frame = CGRectMake(screenWidth / 2 - 20, imageOriginalHeight / 2 - 20, 40, 40)
        
        self.playBtn.setImage(UIImage(named: "play.png"), forState: .Normal)
        
        self.playBtn.addTarget(self, action: #selector(self.palyMV(_:)), forControlEvents: .TouchUpInside)
        
        self.headerImageView.addSubview(self.playBtn)
        
        self.tableView.contentInset = UIEdgeInsetsMake(imageOriginalHeight, 0, 0, 0)
        
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "detailCell")
    }
    
    //MARK:playMV
    func palyMV(sender: AnyObject) {
        //self.navigationController?.popViewControllerAnimated(true)
        self.playVideoWith(model.url!)
        
    }
    //MARK:Nav
    func createNav() {
        
        self.titleLabel?.text = "MV"
        
        self.leftButton?.setImage(UIImage(named: "back.png"), forState: .Normal)
        
        self.addLeftButtonTarget(#selector(self.backToMVListVC))
    }
    
    func backToMVListVC() {
        self.navigationController?.popViewControllerAnimated(true)
        
    }
    
    //MARK:tableview代理方法
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCellWithIdentifier("detailCell", forIndexPath: indexPath)
        switch indexPath.row {
        case 0:
            cell.textLabel?.text = "名称：\(model.title!)"
        case 1:
            cell.textLabel?.text = "歌手：\(model.artistName!)"
        case 2:
            cell.textLabel?.text = "更新时间：\(model.regdate!)"
        case 3:
            cell.textLabel?.allowsDefaultTighteningForTruncation = true
            cell.textLabel?.numberOfLines = 0
            cell.textLabel?.adjustsFontSizeToFitWidth = true
            cell.textLabel?.text = "简介：\(model.des!)"
        default:
            break
        }
        cell.selectionStyle = .None
        cell.textLabel?.textColor = UIColor.lightGrayColor()
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return indexPath.row == 3 ? 300 : 60
    }
    //MARK:playVideo
    
    func playVideoWith(videoUrl: String) {
        afteriOS9WithNormal(videoUrl)
        
    }
    
    
    func afteriOS9WithNormal(videoUrl: String) {
        self.avPlayer = AVPlayerViewController()
        
        let player = AVPlayer(URL: NSURL(string: videoUrl)!)
        avPlayer?.player = player
        
        self.presentViewController(avPlayer!, animated: true, completion: nil)
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
