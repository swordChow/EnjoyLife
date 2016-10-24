//
//  APicCell.swift
//  EnjoyNight
//
//  Created by sword on 16/8/2.
//  Copyright © 2016年 Chow-Chow. All rights reserved.
//

import UIKit

class APicCell: UITableViewCell {
    
    @IBOutlet weak var picDetailLabel: UILabel!
    
    @IBOutlet weak var mainImageView: UIImageView!
    
    var model: APicMoel! {
        didSet {
            mainImageView.sd_setImageWithURL(NSURL(string: model.gq!), placeholderImage: UIImage(named: "placeholder.jpg"))
            picDetailLabel.text = model.pic_datil
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
