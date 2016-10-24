//
//  MVPlayerViewController.swift
//  EnjoyNight
//
//  Created by sword on 16/7/31.
//  Copyright © 2016年 Chow-Chow. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class MVPlayerViewController: AVPlayerViewController {
    
    
    override func shouldAutorotate() -> Bool {
        return true
    }
    
    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.Landscape
    }

}
