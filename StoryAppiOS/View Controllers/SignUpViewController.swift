//
//  SignUpViewController.swift
//  StoryAppiOS
//
//  Created by Sanviraj Zahin Haque on 1/4/20.
//  Copyright © 2020 Sanviraj Zahin Haque. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var SignUpEmail: UITextField!
    @IBOutlet weak var SignUpPassword: UITextField!
    @IBOutlet weak var ConfirmPassword: UITextField!
    @IBOutlet weak var SignUpErrorLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        SignUpErrorLabel.text=""

    }
    
    @IBAction func SignUpTapped(_ sender: Any) {
    }
    
}
