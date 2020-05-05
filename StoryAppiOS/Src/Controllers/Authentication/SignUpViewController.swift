//
//  SignUpViewController.swift
//  StoryAppiOS
//
//  Created by Sanviraj Zahin Haque on 1/4/20.
//  Copyright © 2020 Sanviraj Zahin Haque. All rights reserved.
//

import UIKit
import FirebaseAuth

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
        SignUpErrorLabel.text=""
        Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
            if(error != nil){
                //self.showError("Could not create user")
                self.SignUpErrorLabel.text = error!.localizedDescription
            }
            self.transitionHome()
        }
        
    }
    
    func checkError(_ email:String,_ password:String,_ confirm:String)-> String{
        
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        
        if(email=="" || password=="" || confirm==""){
            return "Fill up the fields properly"
        }
        else if(!emailPred.evaluate(with: email)){
            return "Not an email address"
        }
        else if(password != confirm){
            return "Password do not match"
        }
        return ""
    }
    
    func transitionHome(){
        let homeView = storyboard?.instantiateViewController(identifier: "HomeView") as? HomeViewController
        view.window?.rootViewController = homeView
        view.window?.makeKeyAndVisible()
    }
    
}
