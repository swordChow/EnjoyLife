//
//  ReadCell.swift
//  EnjoyNight
//
//  Created by sword on 16/7/30.
//  Copyright © 2016年 Chow-Chow. All rights reserved.
//

import UIKit

class ReadCell: UITableViewCell {
    
    
    @IBOutlet weak var mainImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var desLabel: UILabel!
    
    
    @IBOutlet weak var ctimeLabel: UILabel!
    
    var model: ReadModel! {
        
        didSet {
            mainImageView.sd_setImageWithURL(NSURL(string: model.picUrl!), placeholderImage: UIImage(named: "placeholder.jpeg"))
            titleLabel.text = model.title
            desLabel.text = model.desc
            ctimeLabel.text = model.ctime
            
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
