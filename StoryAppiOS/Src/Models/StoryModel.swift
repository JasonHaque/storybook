//
//  StoryModel.swift
//  StoryAppiOS
//
//  Created by Sanviraj Zahin Haque on 23/4/20.
//  Copyright © 2020 Sanviraj Zahin Haque. All rights reserved.
//

class StoryModel{
    var storyName : String?
    var storyContent : String?
    var Author : String?
    var Id : String?
    
    init(storyName : String?,storyContent : String?,Author : String?,Id : String?) {
        self.storyName = storyName
        self.storyContent = storyContent
        self.Author = Author
        self.Id = Id
        
    }
}
