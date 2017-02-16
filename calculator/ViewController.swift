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
    @IBOutlet weak var uglyCodeView: UIView!
    var billAmount:Double = 0.0
    var tipAmount:Double = 0.0
    var total:Double = 0.0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        uglyCodeView.isHidden = false
        uglyCodeView.alpha = 0
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    @IBAction func onTap(_ sender: AnyObject) {
        view.endEditing(true)
    
    }
    @IBAction func billFieldValueDidChange(_ sender: Any) {
                self.doMath()
                self.updateAllValueViews()
    
    }
    
    @IBAction func billFieldDidBegin(_ sender: Any) {


        UIView.animate(withDuration: 1, animations: {
            print("start animate")
            self.uglyCodeView.alpha = 1
            self.billField.frame.origin.x = 300
            self.billField.frame.origin.y = 300
        })
    }
    
    @IBAction func segmentValueDidChange(_ sender: Any) {
        self.doMath()
        self.updateAllValueViews()
        
        //Other animations
    }
    
    func updateAllValueViews(){
        tipLabel.text = String(format: "$%.2f", self.tipAmount)
        totalsLabel.text = String(format: "$%.2f", self.total)
    }
    
    
    func doMath() {
        let tipPercentages = [0.15, 0.18, 0.20]
        let bill = Double(billField.text!) ?? 0
        self.tipAmount = bill * tipPercentages[tipControl.selectedSegmentIndex]
        self.total = bill + self.tipAmount
    }
    

}
