//
//  ReadArticleViewController.swift
//  EnjoyNight
//
//  Created by sword on 16/7/30.
//  Copyright © 2016年 Chow-Chow. All rights reserved.
//

import UIKit
import CoreLocation

class ReadArticleViewController: RootViewController,UMSocialUIDelegate {

    
    var model = ReadModel()
    
    var webView = UIWebView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createNav()
        createUI()
        
    }
    //MARK:UI
    func createUI() {
        
        self.webView = UIWebView(frame: self.view.bounds)
        
        let request = NSURLRequest(URL: NSURL(string: self.model.url!)!)
        self.webView.loadRequest(request)
        self.webView.scalesPageToFit = true 
        self.view.addSubview(webView)
        
        
    }
    
    //MARK:Nav
    func createNav() {
        
        self.titleLabel?.text = "文章详情"
        
        self.leftButton?.setImage(UIImage(named: "back.png"), forState: .Normal)
        
        self.addLeftButtonTarget(#selector(ReadArticleViewController.backToReadVC))
        
        self.rightButton?.setImage(UIImage(named: "articleshareIcon.png"), forState: .Normal)
        self.addRightButtonTarget(#selector(self.shareArticle))
        
    }
    //MARK:微博分享
    func shareArticle() {
        
        
        let urlResource = UMSocialUrlResource(snsResourceType: UMSocialUrlResourceTypeImage, url: self.model.picUrl)
        
        UMSocialDataService.defaultDataService().postSNSWithTypes([UMShareToSina], content: model.title!, image: nil, location: nil, urlResource: urlResource) { (response: UMSocialResponseEntity?) in
            
            if response!.responseCode == UMSResponseCodeSuccess {
            print("分享成功")
            }
            else {
                print("分享失败")
            }
        }
        
        
        
    }
    //代理方法 
    
    func didFinishGetUMSocialDataInViewController(response: UMSocialResponseEntity!) {
        if response.responseCode == UMSResponseCodeSuccess {
            print("分享成功")
            
        }
        else if response.responseCode == UMSResponseCodeFaild {
            print("分享失败")
            
        }
    }
    func backToReadVC() {
        
        self.navigationController?.popViewControllerAnimated(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
}
