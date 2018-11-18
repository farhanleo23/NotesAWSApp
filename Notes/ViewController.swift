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
import AWSDynamoDB
import AWSCore


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
    
    func createNote(){
        
        guard let note = Note() else { return }
        note._userId = AWSIdentityManager.default().identityId
        note._noteId = "123"
        note._content = "This is just a text"
        note._creationDate = Date().timeIntervalSince1970 as NSNumber
        let df = DateFormatter()
        df.dateStyle = .short
        df.timeStyle = .short
        note._title = "My note on \(df.string(from: Date()))"
    }


}

