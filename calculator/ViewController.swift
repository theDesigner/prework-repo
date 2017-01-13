//
//  ViewController.swift
//  calculator
//
//  Created by Daniel McGlaughlin on 1/4/17.
//  Copyright © 2017 Daniel McGlaughlin. All rights reserved.
//  Own it!

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalsLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var billTotal: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    @IBAction func onTap(_ sender: AnyObject) {
        view.endEditing(true)
        
        self.billField.alpha = 0
        self.billTotal.alpha = 1
        UIView.animate(withDuration: 0.4, animations: {
            // This causes first view to fade in and second view to fade out
            self.billField.alpha = 1
            self.billTotal.alpha = 0
        })
    
    }
    @IBAction func newCalculateTip(_ sender: AnyObject) {
       
        let tipPercentages = [0.15, 0.18, 0.20]
        let bill = Double(billField.text!) ?? 0
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalsLabel.text = String(format: "$%.2f", total)

        
    }

}
