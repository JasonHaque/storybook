//
//  MyStoryTableViewCell.swift
//  StoryAppiOS
//
//  Created by Sanviraj Zahin Haque on 23/4/20.
//  Copyright © 2020 Sanviraj Zahin Haque. All rights reserved.
//

import UIKit

class MyStoryTableViewCell: UITableViewCell {

    
    @IBOutlet weak var myStoryName: UILabel!
    
    @IBOutlet weak var myStoryContent: UILabel!
    
    @IBOutlet weak var myStoryPrivacy: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
