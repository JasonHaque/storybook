//
//  AllStoriesViewController.swift
//  StoryAppiOS
//
//  Created by Sanviraj Zahin Haque on 3/4/20.
//  Copyright © 2020 Sanviraj Zahin Haque. All rights reserved.
//

import UIKit
import Firebase

class AllStoriesViewController: UIViewController {
    @IBOutlet weak var publicStoriesTable: UITableView!
    var storiesList = [StoryModel]()
    override func viewDidLoad() {
        super.viewDidLoad()
        var ref = Database.database().reference().child("Public Stories").observe(DataEventType.value, with: {(DataSnapshot) in
            if DataSnapshot.childrenCount>0{
                self.storiesList.removeAll()
                for stories in DataSnapshot.children.allObjects as! [DataSnapshot]{
                    let storyObj = stories.value as? [String : AnyObject]
                    let storyName = storyObj?["storyName"]
                    let storyContent = storyObj?["storyContent"]
                    let Id = storyObj?["Id"]
                    let Author = storyObj?["Author"]
                    
                    let story = StoryModel(storyName: storyName as! String?, storyContent: storyContent as! String?, Author: Author as! String?, Id: Id as! String?)
                    self.storiesList.append(story)
                }
                self.publicStoriesTable.reloadData()
            }
            
        })
        

    }
    

}
