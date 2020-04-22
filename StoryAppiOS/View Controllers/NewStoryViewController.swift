//
//  NewStoryViewController.swift
//  StoryAppiOS
//
//  Created by Sanviraj Zahin Haque on 3/4/20.
//  Copyright © 2020 Sanviraj Zahin Haque. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase


class NewStoryViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var StoryNameField: UITextField!
    @IBOutlet weak var StoryContent: UITextField!
    @IBOutlet weak var ErrorLabel: UILabel!
    
    @IBOutlet weak var OptionPicker: UIPickerView!
    var pickerData: [String] = [String]()
    
    
    var ref = Database.database().reference()
    override func viewDidLoad() {
        super.viewDidLoad()
        ErrorLabel.text = ""
        pickerData = ["Public","Private"]
        
        OptionPicker.dataSource = self
        OptionPicker.delegate = self

    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int{
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView,
                    numberOfRowsInComponent component: Int) -> Int{
        return pickerData.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?{
        return pickerData[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
           
       }
    


    @IBAction func SaveButtonTapped(_ sender: Any) {
        let storyName = StoryNameField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let storyContent = StoryContent.text!.trimmingCharacters(in: .whitespaces)
        
        let error = checkErrors(storyName,storyContent)
        if(error != ""){
            ErrorLabel.text = error
            return
        }
        ErrorLabel.text=""
        let pickerOption = pickerData[OptionPicker.selectedRow(inComponent: 0)]
        print(pickerOption)
        saveStory(storyName,storyContent)
        
    }
        @IBAction func ClearButtonTapped(_ sender: Any) {
        StoryNameField.text = ""
        StoryContent.text = ""
        return
        
    }
    
    func checkErrors(_ storyName:String,_ storyContent:String)-> String{
        if(storyName == "" || storyContent == ""){
            return "Fill up the fields please"
        }
        return""
    }
    
    func saveStory(_ storyName:String,_ storyContent:String){
        let email = (Auth.auth().currentUser?.email)!.split(separator: "@")
        let user = String(email[0])
        let key = ref.child("StoryData").child(user).childByAutoId().key
        let storyData = [
            "storyName" : storyName,
            "storyContent" : storyContent,
            "Id" : key
        ]
        ref.child("StoryData").child(user).child(key!).setValue(storyData)
    }
    
    
}
