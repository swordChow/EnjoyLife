//
//  PicCell.swift
//  EnjoyNight
//
//  Created by sword on 16/8/1.
//  Copyright © 2016年 Chow-Chow. All rights reserved.
//

import UIKit

class PicCell: UICollectionViewCell {
    

    @IBOutlet weak var mainImage: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    var model : PicModel! {
        didSet {
            mainImage.sd_setImageWithURL(NSURL(string: model.pic_url!), placeholderImage: UIImage(named: "placeholder.jpg"))
            titleLabel.text = model.title!
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
    
    }

}
