//
//  SettingsViewController.swift
//  tip calculator
//
//  Created by Amit Bharadwaj on 8/17/14.
//  Copyright (c) 2014 Amit Bharadwaj. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var defaultTipField: UITextField!
    
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    @IBAction func onSaveCalled(sender: UIButton) {
        println("save called")
        
        var defaultTip = NSString(string: defaultTipField.text).doubleValue
        var defaults = NSUserDefaults.standardUserDefaults()
        defaults.setDouble(defaultTip, forKey: "default_tip")
        defaults.synchronize()
        
        dismissViewControllerAnimated(true, completion: nil)

    }
    
    
    @IBAction func onCancel(sender: AnyObject) {
        println("cancel called")
        dismissViewControllerAnimated(true, completion: nil)
    }

}
