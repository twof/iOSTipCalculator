//
//  ViewController.swift
//  TipCalculator
//
//  Created by fnord on 6/21/16.
//  Copyright © 2016 twof. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var moneyOwedField: UITextField!
    @IBOutlet var percentageTip: UISegmentedControl!
    @IBOutlet var tipOwedLable: UILabel!
    @IBOutlet var totalAmountOwedWithTipLable: UILabel!
    var possibleTipPercentages = [Float(0.15), Float(0.18), Float(0.20)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tipOwedLable.text = "0"
        totalAmountOwedWithTipLable.text = "0"
        moneyOwedField.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        var endIndex : String.CharacterView.Index!
        if textField.text?.characters.count > 2 && string != "" {
            endIndex = textField.text!.endIndex.advancedBy(-3)
            if (textField.text![endIndex] == ".") {
                return false
            }
        }
        
        if (("0"..."9").contains(string) || string == "." || string == "") {
            return true
        }else{
            return false
        }
    }

    @IBAction func valueChanged(sender: AnyObject) {
        if moneyOwedField.text == "" {
            tipOwedLable.text = "0"
            totalAmountOwedWithTipLable.text = "0"
        }else if Float(moneyOwedField.text!) != nil{
            var tipPercentage : Float
            tipPercentage = possibleTipPercentages[percentageTip.selectedSegmentIndex]
            tipOwedLable.text = "\(String(format: "%.2f", (Float(moneyOwedField.text!)! * tipPercentage)))"
            totalAmountOwedWithTipLable.text = "\(String(format: "%.2f", ((Float(tipOwedLable.text!)! + Float(moneyOwedField.text!)!))))"
        }
    }
    
    @IBAction func segmentedControllerValueChanged(sender: AnyObject) {
        valueChanged(moneyOwedField)
    }
}

