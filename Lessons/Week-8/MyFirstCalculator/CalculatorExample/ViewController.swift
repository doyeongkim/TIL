//
//  ViewController.swift
//  CalculatorExample
//
//  Created by giftbot on 17/04/2019.
//  Copyright © 2019 giftbot. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {

    @IBOutlet weak var displayNum: UILabel!
    
    var currentNum = 0.0
    var previousResult = 0.0
    var isUserTyping = false
    var currentOperator: String? = nil
    var sameOperatorCount = ""
    var isUserPressingNumberButton = false
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func numberButton(_ sender: UIButton) {

        if isUserTyping {
            displayNum.text = displayNum.text! + sender.currentTitle!
        } else {
            displayNum.text = sender.currentTitle!
            isUserTyping = true
        }
        
        isUserPressingNumberButton = true
    }
    
    @IBAction func operatorButton(_ sender: UIButton) {
        
        guard let number = Double(displayNum.text ?? "0") else { return }
        
        isUserTyping = false
        
        switch sender.currentTitle {

        case "+":
            sameOperatorCount = "+"
            if isUserPressingNumberButton == false && sameOperatorCount == "+" {
                currentOperator = nil
            }
            if currentOperator != nil {
                getResults()
            } else {
                currentNum = number
            }
            currentOperator = "+"
            
        case "-":
            sameOperatorCount = "-"
            if isUserPressingNumberButton == false && sameOperatorCount == "-" {
                currentOperator = nil
            }
            if currentOperator != nil {
                getResults()
            } else {
                currentNum = number
            }
            currentOperator = "-"
            
        case "×":
            sameOperatorCount = "*"
            if isUserPressingNumberButton == false && sameOperatorCount == "*" {
                currentOperator = nil
            }
            if currentOperator != nil {
                getResults()
            } else {
                currentNum = number
            }
            currentOperator = "*"
            
        case "÷":
            sameOperatorCount = "/"
            if isUserPressingNumberButton == false && sameOperatorCount == "/" {
                currentOperator = nil
            }
            if currentOperator != nil {
                getResults()
            } else {
                currentNum = number
            }
            currentOperator = "/"
            
        case "=":
            
            getResults()
            
            currentOperator = nil
            
        case "AC":
            displayNum.text = "\(0)"
            currentNum = 0
            currentOperator = nil
            sameOperatorCount = ""

        default:
            break
        }
        
        isUserPressingNumberButton = false
    }
    
    func getResults() {
        
        guard let number = Double(displayNum.text ?? "0") else { return }
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 3
        
        switch currentOperator {
        case "+":
            previousResult = number + currentNum
            displayNum.text = formatter.string(from: previousResult as NSNumber)!
            currentNum = previousResult
        case "-":
            previousResult = currentNum - number
            displayNum.text = formatter.string(from: previousResult as NSNumber)!
            currentNum = previousResult
        case "*":
            previousResult = number * currentNum
            displayNum.text = formatter.string(from: previousResult as NSNumber)!
            currentNum = previousResult
        case "/":
            previousResult = currentNum / number
            displayNum.text = formatter.string(from: previousResult as NSNumber)!
            currentNum = previousResult
        default:
            break
        }
    }
}


