//
//  ViewController.swift
//  StoryAppiOS
//
//  Created by Sanviraj Zahin Haque on 30/3/20.
//  Copyright © 2020 Sanviraj Zahin Haque. All rights reserved.
//

import UIKit
import FirebaseAuth

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        checkCurrentUser()
        
    }
    
    func checkCurrentUser(){
       Auth.auth().addStateDidChangeListener { (auth, user) in
            if user != nil {
                self.transitionHome()
            } else {
                 
            }
        }
    }
    
    func transitionHome(){
        let homeView = storyboard?.instantiateViewController(identifier: "HomeView") as? HomeViewController
        view.window?.rootViewController = homeView
        view.window?.makeKeyAndVisible()
    }


}

