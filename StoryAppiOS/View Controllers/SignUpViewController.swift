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
        let email = SignUpEmail.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = SignUpPassword.text!.trimmingCharacters(in: .newlines)
        let confirm = ConfirmPassword.text!.trimmingCharacters(in: .newlines)
        let error = checkError(email,password,confirm)
        
        if(error != ""){
            SignUpErrorLabel.text = error
            return
        }
        
        
    }
    
    func checkError(_ email:String,_ password:String,_ confirm:String)-> String{
        if(email=="" || password=="" || confirm==""){
            return "Fill up the fields properly"
        }
        else if(password != confirm){
            return "Password do not match"
        }
        return ""
    }
    
}
