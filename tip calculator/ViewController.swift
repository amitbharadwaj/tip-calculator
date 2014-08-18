//
//  ViewController.swift
//  tip calculator
//
//  Created by Amit Bharadwaj on 8/17/14.
//  Copyright (c) 2014 Amit Bharadwaj. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
                            
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    var savedDefault = -1.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
                tipLabel.text = "$0.00"
                totalLabel.text = "$0.00"
        
        var defaults = NSUserDefaults.standardUserDefaults()
        var savedDefault = defaults.doubleForKey("default_tip")

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func onEditingChanged(sender: AnyObject) {
        
        println(savedDefault)
        
                var tipPercentages = [0.18, 0.20, 0.22]
                var tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        
                var billAmount = NSString(string: billField.text).doubleValue
                var tip = billAmount * tipPercentage
                var total = billAmount + tip
                tipLabel.text = String(format: "$%.2f", tip) //"$\(tip)"
                totalLabel.text = String(format: "$%.2f", total) // "$\(total)"

    }
    
    
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
    
    
}

