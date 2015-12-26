//
//  ViewController.swift
//  tipCalc
//
//  Created by Robinson Kameron on 12/23/15.
//  Copyright © 2015 Robinson Kameron. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

 
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var settingsButton: UIBarButtonItem!
    @IBOutlet weak var defaultSettings: UISegmentedControl!
    
    
    @IBAction func actDefaultPer(sender: UISegmentedControl){
        print(defaultSettings.selectedSegmentIndex)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//        tipLabel.text = "$0.00"
//        totalLabel.text = "$0.00"
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

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
    
}

