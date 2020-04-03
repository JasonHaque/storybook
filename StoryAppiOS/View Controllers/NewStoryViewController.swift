//
//  NewStoryViewController.swift
//  StoryAppiOS
//
//  Created by Sanviraj Zahin Haque on 3/4/20.
//  Copyright © 2020 Sanviraj Zahin Haque. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase


class NewStoryViewController: UIViewController {

    @IBOutlet weak var StoryNameField: UITextField!
    @IBOutlet weak var StoryContent: UITextField!
    @IBOutlet weak var ErrorLabel: UILabel!
    var ref = Database.database().reference()
    override func viewDidLoad() {
        super.viewDidLoad()
        ErrorLabel.text = ""
    }
    

    @IBAction func SaveButtonTapped(_ sender: Any) {
        let storyName = StoryNameField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let storyContent = StoryContent.text!.trimmingCharacters(in: .whitespaces)
        
        let error = checkErrors(storyName,storyContent)
        if(error != ""){
            ErrorLabel.text = error
            return
        }
        ErrorLabel.text=""
        ref.child("StoryData").child(Auth.auth().currentUser!.uid).child(storyName).setValue(storyContent)
        
    }
    
    func checkErrors(_ storyName:String,_ storyContent:String)-> String{
        if(storyName == "" || storyContent == ""){
            return "Fill up the fields please"
        }
        return""
    }
}
