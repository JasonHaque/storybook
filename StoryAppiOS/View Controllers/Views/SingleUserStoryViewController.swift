//
//  SingleUserStoryViewController.swift
//  StoryAppiOS
//
//  Created by Sanviraj Zahin Haque on 24/4/20.
//  Copyright © 2020 Sanviraj Zahin Haque. All rights reserved.
//

import UIKit

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
        
        
    }
    

    @IBAction func PublishTapped(_ sender: Any) {
        
    }
    

}
