//
//  ViewController.swift
//  tipCalc
//
//  Created by Robinson Kameron on 12/23/15.
//  Copyright © 2015 Robinson Kameron. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var settingsButton: UIBarButtonItem!
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var defaultPercentage: UISegmentedControl!

    @IBOutlet weak var userNameField: UITextField!
    static let myName = "Full_Human_Name"
    
    let defaults = NSUserDefaults.standardUserDefaults()
    //OKAY
    
    @IBAction func getName(sender: AnyObject) {
        let name = userName
        print(name.text)
        
    }
    
    @IBAction func saveName(sender: AnyObject) {
        print("Name saved")
        if (userName.text!.characters.count > 0) {
            let prefs = NSUserDefaults.standardUserDefaults()
            prefs.setObject(userName.text, forKey: ViewController.myName)
        }

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        
//        let tipOptions = [ 18.0, 20.0, 25.0]
//        
//        defaults.setObject(tipOptions, forKey: "tipOption1")
//        defaults.setInteger(0, forKey: "tipOption1")
//        defaults.synchronize()

        // update labels from NSUserDefaults
        getUserPreferences()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        //print("view will appear")
        var defaults = NSUserDefaults.standardUserDefaults()
        var tipOpt = defaults.integerForKey("defaultTipOption")
        
        if tipOpt == NSNotFound {
            tipOpt = 0
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onEditingChanged(sender: AnyObject) {
        print("User edited bill")
        
        let tipPercentages = [0.18, 0.20, 0.22]
        let tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        
        // Conver the str billField to floating point val
        let billFieldVal = (billField.text! as NSString).doubleValue
        
        // check value of billFieldVal
        print(billFieldVal)
        let tip = billFieldVal * tipPercentage
        let total = tip + billFieldVal

        //Update lables in view
        tipLabel.text = "$\(tip)"
        totalLabel.text = "$\(total)"
        
        // Format to two decimal places
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        }

    @IBAction func onTap_settings(sender: AnyObject) {
        view.endEditing(true)
    }
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
        
    }
    
    // Updates the view with the user values already stored in NSUserDefaults
    func getUserPreferences() {
        let prefs = NSUserDefaults.standardUserDefaults()
        
        // Get Favorite beer
        if let name = prefs.stringForKey(ViewController.myName) {
            userName.text = name
        }
    }
    
    
}

