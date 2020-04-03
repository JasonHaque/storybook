//
//  NewStoryViewController.swift
//  StoryAppiOS
//
//  Created by Sanviraj Zahin Haque on 3/4/20.
//  Copyright © 2020 Sanviraj Zahin Haque. All rights reserved.
//

import UIKit

class NewStoryViewController: UIViewController {

    @IBOutlet weak var StoryNameField: UITextField!
    @IBOutlet weak var StoryContent: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

    @IBAction func SaveButtonTapped(_ sender: Any) {
        let storyName = StoryNameField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let storyContent = StoryContent.text!.trimmingCharacters(in: .whitespaces)
        
        let error = checkErrors(storyName,storyContent)
    }
    
    func checkErrors(_ storyName:String,_ storyContent:String)-> String{
        if(storyName == "" || storyContent == ""){
            return "Fill up the fields please"
        }
        return""
    }
}
