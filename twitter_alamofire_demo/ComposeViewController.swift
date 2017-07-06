//
//  ComposeViewController.swift
//  twitter_alamofire_demo
//
//  Created by Audrey Jones on 7/5/17.
//  Copyright © 2017 Charles Hieger. All rights reserved.
//

import UIKit
import RSKPlaceholderTextView

protocol ComposeViewControllerDelegate {
    func did(post: Tweet)
}

class ComposeViewController: UIViewController {
    
    @IBOutlet weak var tweetTextField: RSKPlaceholderTextView!
    
    var delegate : ComposeViewControllerDelegate?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //delegate = self as? ComposeViewControllerDelegate
        self.tweetTextField = RSKPlaceholderTextView(frame: CGRect(x: 8, y: 80, width: self.view.frame.width, height: 100))
        self.tweetTextField.placeholder = "What's happening?"
        
        self.view.addSubview(self.tweetTextField)
        //tweetTextField!.layer.borderWidth = 1
        //tweetTextField!.layer.borderColor = UIColor.gray.cgColor
        
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didCancelTweet(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

    @IBAction func didSendTweet(_ sender: Any) {
        let tweetText = tweetTextField.text
        APIManager.shared.composeTweet(with: tweetText!) { (tweet, error) in
            if let error = error {
                print("Error composing Tweet: \(error.localizedDescription)")
            } else if let tweet = tweet {
                self.delegate?.did(post: tweet)
                self.dismiss(animated: true, completion: nil)
                self.tweetTextField.text = ""
                print("Compose Tweet Success!")
            }
        }
    }
    
    func did(post: Tweet) {
        self.dismiss(animated: true, completion: nil)
        tweetTextField.text = ""
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
