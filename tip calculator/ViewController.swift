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
    
    var tipPercentages = [0.18, 0.20, 0.22]
    var tipPercentage = -1.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
        getUserDefaultTipPercentage();
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        println("view will appear")
        getUserDefaultTipPercentage()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        println("view did appear")
        updateViews()
    }
    
//    override func viewWillDisappear(animated: Bool) {
//        super.viewWillDisappear(animated)
//        println("view will disappear")
//    }
//    
//    override func viewDidDisappear(animated: Bool) {
//        super.viewDidDisappear(animated)
//        println("view did disappear")
//    }
    
    @IBAction func onEditingChanged(sender: AnyObject) {
        updateViews();
        
    }
    
    
    @IBAction func updateTipOnControlChange(sender: AnyObject) {
        tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        updateViews()
    }
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
    func updateViews() {
        var billAmount = NSString(string: billField.text).doubleValue
        var tip = billAmount * tipPercentage
        var total = billAmount + tip
        tipLabel.text = String(format: "$%.2f", tip) //"$\(tip)"
        totalLabel.text = String(format: "$%.2f", total) // "$\(total)"
    }
    
    func getUserDefaultTipPercentage() {
        var defaults = NSUserDefaults.standardUserDefaults()
        var savedDefault = defaults.doubleForKey("default_tip")
        if (savedDefault != nil) {
            tipPercentage = savedDefault
        } else {
            tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        }
        println(tipPercentage)
    }
    
}

