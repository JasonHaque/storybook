//
//  LogInViewController.swift
//  StoryAppiOS
//
//  Created by Sanviraj Zahin Haque on 1/4/20.
//  Copyright © 2020 Sanviraj Zahin Haque. All rights reserved.
//

import UIKit

class LogInViewController: UIViewController {
    @IBOutlet weak var EmailAddress: UITextField!
    @IBOutlet weak var Password: UITextField!
    @IBOutlet weak var LogInErrorLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        LogInErrorLabel.text=""

        
    }
    
    @IBAction func LogInTapped(_ sender: Any) {
    }
    
   

}
