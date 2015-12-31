//
//  SettingsController.swift
//  tipCalc
//
//  Created by Robinson Kameron on 12/31/15.
//  Copyright © 2015 Robinson Kameron. All rights reserved.
//

import UIKit

class SettingsController: UIViewController {

    @IBOutlet weak var defaultPercentage: UISegmentedControl!
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var userNameField: UITextField!
    @IBOutlet weak var saveName: UIButton!
    static let myName = "Full_Human_Name"
    @IBOutlet weak var currentName: UITextView!
    
    let defaults = NSUserDefaults.standardUserDefaults()
    
    @IBAction func getName(sender: AnyObject) {
        let name = userName
        print(name.text)
        
    }
    
    @IBAction func saveName(sender: AnyObject) {
        print("Name saved")
        if (userName.text!.characters.count > 0) {
            let prefs = NSUserDefaults.standardUserDefaults()
            prefs.setObject(userName.text, forKey: SettingsController.myName)
            
        }

    }

    override func viewDidLoad() {
        super.viewDidLoad()

        getUserPreferences()
    }
    
        // Updates the view with the user values already stored in NSUserDefaults
        func getUserPreferences() {
            let prefs = NSUserDefaults.standardUserDefaults()
    
            // Get username
            if let name = prefs.stringForKey(SettingsController.myName) {
              currentName.text = name + " !"
            }
        }
    
}
