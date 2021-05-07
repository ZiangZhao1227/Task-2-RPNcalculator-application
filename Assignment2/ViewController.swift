//
//  ViewController.swift
//  Assignment2
//
//  Created by iosdev on 30.3.2021.
//

import UIKit

class ViewController: UIViewController {
    
    private let myStack = IntStack()
    private var firstNum : Double = 0.0
    private var secondNum : Double = 0.0
    private var resultNum : Double = 0.0
    
    @IBOutlet weak var divide: UIButton!
    @IBOutlet weak var times: UIButton!
    @IBOutlet weak var plus: UIButton!
    @IBOutlet weak var minus: UIButton!
    @IBOutlet weak var number: UILabel!
    @IBOutlet weak var clear: UIButton!
    
    @IBAction func numbers(_ sender: UIButton) {
        if number.text == "please enter two numbers and then press the operator button." {
            number.text = String(sender.tag - 1)
        }else if(number.text == "push one more number in the stack" ){
            number.text = String(sender.tag - 1)
        }else if(number.text == "Please delete some of the numbers to ensure that the calculation runs properly"){
            number.text = String(sender.tag - 1)
        }else if(number.text == "this stack is empty"){
            number.text = String(sender.tag - 1)
        }else if(number.text == "Select the operator to complete the calculation"){
            number.text = String(sender.tag - 1)
        }else{
            number.text = (number.text ?? "" ) + String(sender.tag - 1)
        }
    }
    
    @IBAction func oprators(_ sender: UIButton) {
        
        if sender.tag == 0 {
            number.text = "/"
            firstNum = Double(myStack.pop() ?? 0)
            secondNum = Double(myStack.pop() ?? 0)
            resultNum = Double(secondNum) / Double(firstNum)
            print(resultNum)
            number.text = "\(secondNum) / \(firstNum) = \(resultNum)"
            buttonEnable()
        } else if sender.tag == 1 {
            number.text = "*"
            firstNum = Double(myStack.pop() ?? 0)
            secondNum = Double(myStack.pop() ?? 0)
            resultNum = Double(secondNum) * Double(firstNum)
            print(resultNum)
            number.text = "\(secondNum) * \(firstNum) = \(resultNum)"
            buttonEnable()
        } else if sender.tag == 2 {
            number.text = "+"
            firstNum = Double(myStack.pop() ?? 0)
            secondNum = Double(myStack.pop() ?? 0)
            resultNum = Double(secondNum) + Double(firstNum)
            print(resultNum)
            number.text = "\(secondNum) + \(firstNum) = \(resultNum)"
            buttonEnable()
        } else {
            number.text = "-"
            firstNum = Double(myStack.pop() ?? 0)
            secondNum = Double(myStack.pop() ?? 0)
            resultNum = Double(secondNum) - Double(firstNum)
            print(resultNum)
            number.text = "\(secondNum) - \(firstNum) = \(resultNum)"
            buttonEnable()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        number.text = "please enter two numbers and then press the operator button."
        
        print(myStack.stackNum())
        
        if myStack.hasTwo() == false {
            
            minus.isEnabled = false
            
            plus.isEnabled = false
            
            divide.isEnabled = false
            
            times.isEnabled = false
            
            clear.isEnabled = false
            
        }
        
    }
    
    @IBAction func CleanStack(_ sender: UIButton) {
        
        if myStack.stackArray.count != 0{
            myStack.stackArray.removeLast()
        }else{
            number.text = "this stack is empty"
            clear.isEnabled = false
        }
        
        if myStack.stackArray.count == 1 {
            number.text = "push one more number in the stack"
        }else if myStack.stackArray.count == 2{
            number.text = "Select the operator to complete the calculation"
        }
        
        buttonEnable()
        
    }
    
    @IBAction func enterButton(_ sender: UIButton) {
        
        myStack.push(v: Double(number.text ?? "0") ?? Double(resultNum))
        number.text = nil
        myStack.printNum()
        if myStack.stackArray.count == 1 {
            number.text = "push one more number in the stack"
        }else if myStack.stackArray.count == 2{
            number.text = "Select the operator to complete the calculation"
        }else{
            number.text = "Please delete some of the numbers to ensure that the calculation runs properly"
        }
        
        if myStack.stackArray.count != 0{
            clear.isEnabled = true
            
        }else{
            number.text = "this stack is empty"
            clear.isEnabled = false
            
        }
        
        // Enable the buttons and change colors if the stack does have 2 values
        buttonEnable()
        
    }
    
    func buttonEnable() {
        if myStack.hasTwo() {
            
            minus.isEnabled = true
            minus.backgroundColor = UIColor.green
            
            plus.isEnabled = true
            plus.backgroundColor = UIColor.green
            
            divide.isEnabled = true
            divide.backgroundColor = UIColor.green
            
            times.isEnabled = true
            times.backgroundColor = UIColor.green
            
        }
        else{
            minus.isEnabled = false
            minus.backgroundColor = UIColor.systemRed
            
            plus.isEnabled = false
            plus.backgroundColor = UIColor.systemRed
            
            divide.isEnabled = false
            divide.backgroundColor = UIColor.systemRed
            
            times.isEnabled = false
            times.backgroundColor = UIColor.systemRed
            
        }
    }
    
}
