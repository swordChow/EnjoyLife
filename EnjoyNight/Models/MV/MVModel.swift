//
//  MVModel.swift
//  EnjoyNight
//
//  Created by sword on 16/7/31.
//  Copyright © 2016年 Chow-Chow. All rights reserved.
//

import UIKit

class MVModel: NSObject {
    
    var artistName: String?
    
    var albumImg : String?
    
    var des : String?
    
    var url: String?
    
    var playListPic: String?
    
    var title: String?
    
    
    var regdate: String?
    
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {
        
        if key == "description" {
            self.des = value as! String
        }
    }
    
    

}
