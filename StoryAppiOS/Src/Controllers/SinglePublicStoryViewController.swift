//
//  singlePublicStoryViewController.swift
//  StoryAppiOS
//
//  Created by Sanviraj Zahin Haque on 24/4/20.
//  Copyright © 2020 Sanviraj Zahin Haque. All rights reserved.
//

import UIKit

class SinglePublicStoryViewController: UIViewController {

    @IBOutlet weak var SngleStory: UILabel!
    var mystory : String? = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        SngleStory.text = mystory
        // Do any additional setup after loading the view.
    }
    

}
