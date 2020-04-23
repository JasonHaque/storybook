//
//  MyStoriesViewController.swift
//  StoryAppiOS
//
//  Created by Sanviraj Zahin Haque on 23/4/20.
//  Copyright © 2020 Sanviraj Zahin Haque. All rights reserved.
//

import UIKit
import Firebase

class MyStoriesViewController: UIViewController {

    @IBOutlet weak var myStoryTableView: UITableView!
    
    var myStoryList = [MyStoryModel]()
    override func viewDidLoad() {
        super.viewDidLoad()
        let email = (Auth.auth().currentUser?.email)!.split(separator: "@")
        let user = String(email[0])
        let ref = Database.database().reference().child("StoryData").child(user)
        ref.observe(DataEventType.value) { (DataSnapshot) in
            if DataSnapshot.childrenCount > 0{
                self.myStoryList.removeAll()
                for stories in DataSnapshot.children.allObjects as! [DataSnapshot]{
                    let storyObj = stories.value as? [String : AnyObject]
                    let storyName = storyObj?["storyName"]
                    let storyContent = storyObj?["storyContent"]
                    let Id = storyObj?["Id"]
                    let privacy = storyObj?["privacy"]
                    let mystory = MyStoryModel(storyName: storyName as! String?, storyContent: storyContent as! String?, privacy:  privacy as! String?, Id: Id as! String?)
                    
                    self.myStoryList.append(mystory)
                }
                self.myStoryTableView.reloadData()
            }
        }
    }
    
}
