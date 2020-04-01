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
        let email =  EmailAddress.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = Password.text!.trimmingCharacters(in: .newlines)
        
        let error = checkError(email,password)
        
        if(error != ""){
            LogInErrorLabel.text = error
            return
        }
        LogInErrorLabel.text = ""
    }
    
    func checkError(_ email:String, _ password:String) -> String{
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        if(email == "" || password == ""){
            return "Fill up the fields properly"
        }
        else if(!emailPred.evaluate(with: email)){
            return "Not an email address"
        }
        
        return ""
    }
    
   

}
