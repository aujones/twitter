//
//  ProfileTweetCell.swift
//  twitter_alamofire_demo
//
//  Created by Audrey Jones on 7/6/17.
//  Copyright © 2017 Charles Hieger. All rights reserved.
//

import UIKit

class ProfileTweetCell: UITableViewCell {
    
    var tweet : Tweet! {
        didSet {
            // update UI view (outlets)
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
