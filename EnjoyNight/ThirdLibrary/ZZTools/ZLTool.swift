//
//  ZLTool.swift
//  EnjoyNight
//
//  Created by sword on 16/7/29.
//  Copyright © 2016年 Chow-Chow. All rights reserved.
//

import Foundation

let screenWidth = UIScreen.mainScreen().bounds.size.width

let screenHeight = (UIScreen.mainScreen().bounds.size.height - 64)

let firstMVUrl = "http://mapi.yinyuetai.com/video/list.json?deviceinfo=%7B%22aid%22%3A%2210201022%22%2C%22os%22%3A%22Android%22%2C%22ov%22%3A%224.1.2%22%2C%22rn%22%3A%22480*800%22%2C%22dn%22%3A%22Jiayu%20G2H%22%2C%22cr%22%3A%2246002%22%2C%22as%22%3A%22WIFI%22%2C%22uid%22%3A%226c9d15f9e4fead03f9bfe8c9f3a14735%22%2C%22clid%22%3A110004000%7D&area=FS&offset=0"

let mainLandUrl = "http://mapi.yinyuetai.com/video/list.json?deviceinfo=%7B%22aid%22%3A%2210201022%22%2C%22os%22%3A%22Android%22%2C%22ov%22%3A%224.1.2%22%2C%22rn%22%3A%22480*800%22%2C%22dn%22%3A%22Jiayu%20G2H%22%2C%22cr%22%3A%2246002%22%2C%22as%22%3A%22WIFI%22%2C%22uid%22%3A%226c9d15f9e4fead03f9bfe8c9f3a14735%22%2C%22clid%22%3A110004000%7D&area=ML&offset=0"

let hktwUrl = "http://mapi.yinyuetai.com/video/list.json?deviceinfo=%7B%22aid%22%3A%2210201022%22%2C%22os%22%3A%22Android%22%2C%22ov%22%3A%224.1.2%22%2C%22rn%22%3A%22480*800%22%2C%22dn%22%3A%22Jiayu%20G2H%22%2C%22cr%22%3A%2246002%22%2C%22as%22%3A%22WIFI%22%2C%22uid%22%3A%226c9d15f9e4fead03f9bfe8c9f3a14735%22%2C%22clid%22%3A110004000%7D&area=HT&offset=0"

let westernUrl = "http://mapi.yinyuetai.com/video/list.json?deviceinfo=%7B%22aid%22%3A%2210201022%22%2C%22os%22%3A%22Android%22%2C%22ov%22%3A%224.1.2%22%2C%22rn%22%3A%22480*800%22%2C%22dn%22%3A%22Jiayu%20G2H%22%2C%22cr%22%3A%2246002%22%2C%22as%22%3A%22WIFI%22%2C%22uid%22%3A%226c9d15f9e4fead03f9bfe8c9f3a14735%22%2C%22clid%22%3A110004000%7D&area=US&offset=0"

let japanUrl = "http://mapi.yinyuetai.com/video/list.json?deviceinfo=%7B%22aid%22%3A%2210201022%22%2C%22os%22%3A%22Android%22%2C%22ov%22%3A%224.1.2%22%2C%22rn%22%3A%22480*800%22%2C%22dn%22%3A%22Jiayu%20G2H%22%2C%22cr%22%3A%2246002%22%2C%22as%22%3A%22WIFI%22%2C%22uid%22%3A%226c9d15f9e4fead03f9bfe8c9f3a14735%22%2C%22clid%22%3A110004000%7D&area=JP&offset=0"

let koreanUrl = "http://mapi.yinyuetai.com/video/list.json?deviceinfo=%7B%22aid%22%3A%2210201022%22%2C%22os%22%3A%22Android%22%2C%22ov%22%3A%224.1.2%22%2C%22rn%22%3A%22480*800%22%2C%22dn%22%3A%22Jiayu%20G2H%22%2C%22cr%22%3A%2246002%22%2C%22as%22%3A%22WIFI%22%2C%22uid%22%3A%226c9d15f9e4fead03f9bfe8c9f3a14735%22%2C%22clid%22%3A110004000%7D&area=KR&offset=0"


extension UIColor {
    
    static func  RGBA(red: CGFloat, _ green: CGFloat, _ blue: CGFloat, _ alpha: CGFloat = 1) -> UIColor {
        
        return UIColor(red: red / 255.0, green: green / 255.0, blue: blue / 255.0, alpha: alpha)
    
    }
 }
