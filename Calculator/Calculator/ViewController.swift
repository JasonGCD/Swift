//
//  ViewController.swift
//  Calculator
//
//  Created by MAC on 16/4/21.
//  Copyright © 2016年 JasonMax. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var display: UILabel!
    var userIsInTheMiddleOfTypingANumber:Bool = false//这里的bool和前面的冒号可以去掉

    @IBAction func appendDigit(sender: UIButton) {
        
        let digit = sender.currentTitle!
        print("digit = \(digit)")
        
        if userIsInTheMiddleOfTypingANumber {
            
        display.text = display.text! + digit
            
        } else {
            
            display.text = digit
            userIsInTheMiddleOfTypingANumber = true
        }
    }
    
    @IBAction func operate(sender: UIButton) {
        let operation = sender.currentTitle!
        if userIsInTheMiddleOfTypingANumber {
        enter()
        }
        switch operation {
        case "×":performOperation{ $0 * $1 }
        case "÷":performOperation{ $0 / $1 }
        case "+":performOperation{ $0 + $1 }
        case "−":performOperation{ $0 - $1 }
        case "√":performOperation0{ sqrt($0) }
        default: break
        }
    
    }
    
    func performOperation(operation: (Double, Double)->Double) {
        
        if operandStack.count >= 2{
            displayValue = operation(operandStack.removeLast() , operandStack.removeLast())
            
            enter()
        }

    }
    func performOperation0(operation:  Double->Double) {
        
        if operandStack.count >= 1{
            displayValue = operation( operandStack.removeLast())
            
            enter()
        }
        
    }
    
    var operandStack = Array<Double>()
    
    @IBAction func enter() {
        
        userIsInTheMiddleOfTypingANumber = false
        operandStack.append(displayValue)
        print("operandStack = \(operandStack)")
    }
    
    var displayValue: Double {
        get {
            return NSNumberFormatter().numberFromString(display.text!)!.doubleValue
        }
        set {
            display.text = "\(newValue)"
            userIsInTheMiddleOfTypingANumber = false
        }
    }
    
}












