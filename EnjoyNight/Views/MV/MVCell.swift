//
//  MVCell.swift
//  EnjoyNight
//
//  Created by sword on 16/7/31.
//  Copyright © 2016年 Chow-Chow. All rights reserved.
//

import UIKit



class MVCell: UITableViewCell {
    
    
    @IBOutlet weak var mainImage: UIImageView!
    
    @IBOutlet weak var ablumNameLabel: UILabel!
    
    @IBOutlet weak var artistNameLabel: UILabel!
    
    @IBOutlet weak var regdateLabel: UILabel!
    
    var model: MVModel! {
        
        didSet {
            self.mainImage.sd_setImageWithURL(NSURL(string: model.albumImg!), placeholderImage: UIImage(named: ""))
            self.ablumNameLabel.text = model.title
            
            self.artistNameLabel.text = model.artistName
            
            self.regdateLabel.text = model.regdate
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
