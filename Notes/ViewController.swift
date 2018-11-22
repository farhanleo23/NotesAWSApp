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
    } else {
        
        createNote(noteID: "100")
        createNote(noteID: "101")
        createNote(noteID: "102")
        loadNote(noteID: "123")
        updateNote(noteID: "123", content: "updated note")
        deleteNote(noteID: "123")
        queryNotes()
        
        }
    }
    
    func createNote(noteID: String){
        
        guard let note = Note() else { return }
        note._userId = AWSIdentityManager.default().identityId
        note._noteId = noteID
        note._content = "This is just a text"
        note._creationDate = Date().timeIntervalSince1970 as NSNumber
        let df = DateFormatter()
        df.dateStyle = .short
        df.timeStyle = .short
        note._title = "My note on \(df.string(from: Date()))"
        saveData(note: note)
    }
    
    
    func saveData(note: Note){
        let dbObjectMapper = AWSDynamoDBObjectMapper.default()
        dbObjectMapper.save(note) { (error) in
            print(error?.localizedDescription ?? "no error")
        }
        
    }
    
    func loadNote(noteID: String){
        let dbObjectMapper = AWSDynamoDBObjectMapper.default()
        if let hashKey = AWSIdentityManager.default().identityId{
            dbObjectMapper.load(Note.self, hashKey: hashKey, rangeKey: noteID){ (model, error)
                in
                if let note = model as? Note{
                    print(note._content ?? "no content")
                }
            }
        }
    }

    func updateNote(noteID: String, content: String){
        let dbObjectMapper = AWSDynamoDBObjectMapper.default()
        if let hashKey = AWSIdentityManager.default().identityId{
            dbObjectMapper.load(Note.self, hashKey: hashKey, rangeKey: noteID){ (model, error)
                in
                if let note = model as? Note{
                    note._content = content
                    self.saveData(note: note)
                }
            }
        }
    }
    
    func deleteNote(noteID: String){
        if let note = Note(){
            note._userId = AWSIdentityManager.default().identityId
            note._noteId = noteID
            let dbObjectMapper = AWSDynamoDBObjectMapper.default()
            dbObjectMapper.remove(note) { (error) in
                print(error?.localizedDescription ?? "no error")
            }
        }
    }
    
    func queryNotes(){
        let qExp = AWSDynamoDBQueryExpression()
        
        qExp.keyConditionExpression = "#uId = :userId"
        
        qExp.expressionAttributeNames = ["#uId": "userId"]
        qExp.expressionAttributeValues = [":userId": AWSIdentityManager.default().identityId!]
        
        let objMapper = AWSDynamoDBObjectMapper.default()
        objMapper.query(Note.self, expression: qExp) { (output, error) in
            if let notes = output?.items as? [Note] {
                notes.forEach({(note) in
                    print(note._content ?? "no content")
                    print(note._noteId ?? "no ID")
                    
                })
            }
        }
        
    }

}

