//
//  MyStoryModel.swift
//  StoryAppiOS
//
//  Created by Sanviraj Zahin Haque on 23/4/20.
//  Copyright © 2020 Sanviraj Zahin Haque. All rights reserved.
//

class MyStoryModel{
    var storyName : String?
    var storyContent : String?
    var privacy : String?
    var Id : String?
    
    init(storyName : String?,storyContent : String?,privacy : String?,Id : String?) {
        self.storyName = storyName
        self.storyContent = storyContent
        self.privacy = privacy
        self.Id = Id
        
    }
}
