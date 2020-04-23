//
//  AllStoriesViewController.swift
//  StoryAppiOS
//
//  Created by Sanviraj Zahin Haque on 3/4/20.
//  Copyright © 2020 Sanviraj Zahin Haque. All rights reserved.
//

import UIKit
import Firebase

class AllStoriesViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
    @IBOutlet weak var publicStoriesTable: UITableView!
    var storiesList = [StoryModel]()
    var dataTosend : String = ""
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return storiesList.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StoryCell", for: indexPath) as! ViewControllerTableViewCell
        let story : StoryModel
        story = storiesList[indexPath.row]
        cell.StoryNameCell.text = story.storyName
        cell.AuthorNameCell.text = story.Author
        cell.StoryContentCell.text = story.storyContent
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let story = storiesList[indexPath.row]
        dataTosend = story.storyContent!
        self.performSegue(withIdentifier: "showSinglePublicStory", sender: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let info = segue.destination as! SinglePublicStoryViewController
        info.mystory = dataTosend
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

        return 200
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let ref = Database.database().reference().child("Public Stories").observe(DataEventType.value, with: {(DataSnapshot) in
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
