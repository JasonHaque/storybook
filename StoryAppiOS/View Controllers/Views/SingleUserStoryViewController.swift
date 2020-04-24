//
//  SingleUserStoryViewController.swift
//  StoryAppiOS
//
//  Created by Sanviraj Zahin Haque on 24/4/20.
//  Copyright © 2020 Sanviraj Zahin Haque. All rights reserved.
//

import UIKit

class SingleUserStoryViewController: UIViewController {

    @IBOutlet weak var UserStory: UILabel!
    var strStory:String? = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UserStory.text = strStory
        
    }
    

   

}
