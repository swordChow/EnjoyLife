//
//  ReadModel.swift
//  EnjoyNight
//
//  Created by sword on 16/7/30.
//  Copyright © 2016年 Chow-Chow. All rights reserved.
//

import UIKit

class ReadModel: NSObject {
    
    var title: String?
    var picUrl: String?
    var url: String?
    var ctime: String?
    var desc: String?
    
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {
        if key == "description" {
            self.desc = value as! String
        }
    }

}
