//
//  ProfileTweetCell.swift
//  twitter_alamofire_demo
//
//  Created by Audrey Jones on 7/6/17.
//  Copyright © 2017 Charles Hieger. All rights reserved.
//

import UIKit

class ProfileTweetCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var usernameLabel: UILabel!
    
    @IBOutlet weak var timeStampLabel: UILabel!
    
    @IBOutlet weak var tweetTextLabel: UILabel!
    
    @IBOutlet weak var numReplies: UILabel!
    
    @IBOutlet weak var numRetweets: UILabel!
    
    @IBOutlet weak var numFavorites: UILabel!
    
    @IBOutlet weak var profilePic: UIImageView!
    
    var user : User = User.current!
    
    
    var tweet : Tweet! {
        didSet {
            let currentuser = tweet.user
            profilePic.af_setImage(withURL: currentuser.profileURL)
            usernameLabel.text = currentuser.screenName
            timeStampLabel.text = tweet.createdAtString
            
            tweetTextLabel.text = tweet.text
            numReplies.text = ""
            numRetweets.text = "\(tweet.retweetCount)"
            numFavorites.text = "\(tweet.favoriteCount ?? 0)"
            nameLabel.text = currentuser.name
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
