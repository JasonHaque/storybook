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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
