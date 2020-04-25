//
//  MyStoriesViewController.swift
//  StoryAppiOS
//
//  Created by Sanviraj Zahin Haque on 23/4/20.
//  Copyright © 2020 Sanviraj Zahin Haque. All rights reserved.
//

import UIKit
import Firebase

class MyStoriesViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var myStoryTableView: UITableView!
    
    var myStoryList = [MyStoryModel]()
    var storyTosend : String = ""
    var storyNameTosend : String = ""
    var storyPrivacyTosend :String = ""
    var storyIdTosend : String = ""
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myStoryList.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyStoryCell", for: indexPath) as! MyStoryTableViewCell
        let myStory : MyStoryModel
        myStory = myStoryList[indexPath.row]
        cell.myStoryName.text = myStory.storyName
        cell.myStoryContent.text = myStory.storyContent
        cell.myStoryPrivacy.text = myStory.privacy
        return cell
        
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
           let story = myStoryList[indexPath.row]
           storyTosend = story.storyContent!
           storyNameTosend = story.storyName!
           storyPrivacyTosend = story.privacy!
           self.performSegue(withIdentifier: "ShowSingle", sender: nil)
       }
       override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            
            let info = segue.destination as! SingleUserStoryViewController
            info.strStory = storyTosend
            info.strName = storyNameTosend
            info.strPrivacy = storyPrivacyTosend
            info.strId = storyIdTosend
        
        
       }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

        return 200
    }
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
