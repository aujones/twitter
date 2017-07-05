//
//  TweetCell.swift
//  twitter_alamofire_demo
//
//  Created by Charles Hieger on 6/18/17.
//  Copyright © 2017 Charles Hieger. All rights reserved.
//

import UIKit
import AlamofireImage

class TweetCell: UITableViewCell {
    
    @IBOutlet weak var tweetTextLabel: UILabel!
    
    @IBOutlet weak var timeStampLabel: UILabel!
    
    @IBOutlet weak var profilePic: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var usernameLabel: UILabel!
    
    @IBOutlet weak var repliesLabel: UILabel!
    
    @IBOutlet weak var retweetsLabel: UILabel!
    
    @IBOutlet weak var likesLabel: UILabel!
    
    @IBOutlet weak var replyButton: UIButton!
    
    @IBOutlet weak var retweetButton: UIButton!
    
    @IBOutlet weak var likeButton: UIButton!
    
    
    var tweet: Tweet! {
        didSet {
            tweetTextLabel.text = tweet.text
            let currentuser = tweet.user
            usernameLabel.text = "@\(currentuser.screenName)"
            nameLabel.text = currentuser.name
            profilePic.af_setImage(withURL: currentuser.profileURL)
            repliesLabel.text = "0"
            retweetsLabel.text = "\(tweet.retweetCount)"
            likesLabel.text = "\(tweet.favoriteCount ?? 0)"
            timeStampLabel.text = tweet.createdAtString
        }
    }
    
    @IBAction func tapRetweet(_ sender: Any) {
        if(retweetButton.isSelected) {
            retweetButton.isSelected = false
            tweet.retweetCount -= 1
            tweet.retweeted = false
        }
        else {
            retweetButton.isSelected = true
            tweet.retweetCount += 1
            tweet.retweeted = true
        }
        refreshData()
        
        
    }
    
    @IBAction func tapLike(_ sender: Any) {
        if(likeButton.isSelected) {
            likeButton.isSelected = false
            tweet.favoriteCount? -= 1
            tweet.favorited = false
            APIManager.shared.unfavorite(tweet) { (tweet: Tweet?, error: Error?) in
                if let error = error {
                    print("Error unfavoriting tweet: \(error.localizedDescription)")
                } else if let tweet = tweet {
                    print("Successfully unfavorited the following Tweet: \n\(tweet.text)")
                }
            }
        }else {
            likeButton.isSelected = true
            tweet.favoriteCount? += 1
            tweet.favorited = true
            APIManager.shared.favorite(tweet) { (tweet: Tweet?, error: Error?) in
                if let  error = error {
                    print("Error favoriting tweet: \(error.localizedDescription)")
                } else if let tweet = tweet {
                    print("Successfully favorited the following Tweet: \n\(tweet.text)")
                }
            }
        }
        refreshData()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    
    // updates all data that might've changed since tweets were interacted with
    
    func refreshData() {
        retweetsLabel.text = "\(tweet.retweetCount)"
        likesLabel.text = "\(tweet.favoriteCount ?? 0)"
        
        
    }
    
}
