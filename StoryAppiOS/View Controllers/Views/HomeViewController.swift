//
//  HomeViewController.swift
//  StoryAppiOS
//
//  Created by Sanviraj Zahin Haque on 1/4/20.
//  Copyright © 2020 Sanviraj Zahin Haque. All rights reserved.
//

import UIKit
import FirebaseAuth

class HomeViewController: UIViewController {

    @IBOutlet weak var WelcomeLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        WelcomeLabel.text = "Welcome " + (Auth.auth().currentUser?.email)!
        
    }
    
    
    @IBAction func LogoutBarTapped(_ sender: Any) {
        
        let firebaseAuth = Auth.auth()
        do {
          try firebaseAuth.signOut()
            print("Signed out")
            self.transitionStart()
        } catch let signOutError as NSError {
          print ("Error signing out: %@", signOutError)
        }
    }
    
    @IBAction func LogOutTapped(_ sender: Any) {
        let firebaseAuth = Auth.auth()
        do {
          try firebaseAuth.signOut()
            print("Signed out")
            self.transitionStart()
        } catch let signOutError as NSError {
          print ("Error signing out: %@", signOutError)
        }
        
    }
    
    func transitionStart(){
        let homeView = storyboard?.instantiateViewController(identifier: "StartView") as? ViewController
        view.window?.rootViewController = homeView
        view.window?.makeKeyAndVisible()
    }
}
