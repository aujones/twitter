//
//  ProfileViewController.swift
//  twitter_alamofire_demo
//
//  Created by Audrey Jones on 7/5/17.
//  Copyright © 2017 Charles Hieger. All rights reserved.
//

import UIKit
import AlamofireImage

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var backgroundImageView: UIImageView!
    
    @IBOutlet weak var profilePicture: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var usernameLabel: UILabel!
    
    @IBOutlet weak var followingLabel: UILabel!
    
    @IBOutlet weak var followersLabel: UILabel!
    
    var user : User = User.current!

    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = user.name
        usernameLabel.text = "@\(user.screenName)"
        followingLabel.text = "\(user.following)"
        followersLabel.text = "\(user.followers)"
        if(user.backgroundURL != nil) {
            backgroundImageView.af_setImage(withURL: user.backgroundURL!)
        }
        profilePicture.af_setImage(withURL: user.profileURL)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didTapLogout(_ sender: Any) {
        APIManager.shared.logout()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
