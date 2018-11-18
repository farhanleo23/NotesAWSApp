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

//webClient
//808734385241-5dl6ipjgf46fj63e73dn397d8hatj8lu.apps.googleusercontent.com
//secret: KeTYem3p0B2f0a__0L-bUhe9
//iOS crendtials: 808734385241-a2q80ktjsv61e935p5ot8ch6oplpm02k.apps.googleusercontent.com
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    @IBAction func logOut(_ sender: Any) {
        AWSSignInManager.sharedInstance().logout { (value, error) in
            self.checkForLogin()
        }
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        checkForLogin()
    }
    
    //checks if the user is signed in
    //if signed in does not present the sign up page
    func checkForLogin(){
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

