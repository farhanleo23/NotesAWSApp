//
//  ViewController.swift
//  Notes
//
//  Created by Farhan Hussain on 11/14/18.
//  Copyright © 2018 maypalo. All rights reserved.
//

import UIKit
import AWSAuthCore
import AWSAuthUI

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        //checks if the user is signed in
        //if signed in does not present the sign up page
        if !AWSSignInManager.sharedInstance().isLoggedIn {
            AWSAuthUIViewController.presentViewController(with: self.navigationController!, configuration: nil) { (provider, error) in
                if error == nil {
                    print("success")
                } else {
                    print(error?.localizedDescription ?? "no value")
                }
            }
        }
    }


}

