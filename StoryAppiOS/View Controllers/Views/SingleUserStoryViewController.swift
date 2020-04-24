//
//  SingleUserStoryViewController.swift
//  StoryAppiOS
//
//  Created by Sanviraj Zahin Haque on 24/4/20.
//  Copyright © 2020 Sanviraj Zahin Haque. All rights reserved.
//

import UIKit
import Firebase

class SingleUserStoryViewController: UIViewController {

    
    @IBOutlet weak var strStoryField: UITextField!
    
    @IBOutlet weak var strStoryContentField: UITextField!
   
    @IBOutlet weak var publishButton: UIButton!
    
    var strStory:String? = ""
    var strName : String? = ""
    var strPrivacy : String? = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        publishButton.isHidden = true
        strStoryField.text = strName
        strStoryContentField.text = strStory
        
        if(strPrivacy == "Private"){
            publishButton.isHidden = false
        }
        
    }
    

    @IBAction func PublishTapped(_ sender: Any) {
        let storyName = strStoryField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let storyContent = strStoryContentField.text!.trimmingCharacters(in: .newlines)
        saveToAll(storyName, storyContent)
    }
    
    func saveToAll(_ storyName:String,_ storyContent:String){
        let ref = Database.database().reference()
        let key = ref.child("Public Stories").childByAutoId().key
        let email = (Auth.auth().currentUser?.email)!.split(separator: "@")
        let user = String(email[0])
        let storyData = [
            "storyName" : storyName,
            "storyContent" : storyContent,
            "Author" : user,
            "Id" : key
        ]
        ref.child("Public Stories").child(key!).setValue(storyData)
        publishButton.isHidden = true
        
        
    }
    

}
