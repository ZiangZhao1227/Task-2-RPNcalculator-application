//
//  IntStack.swift
//  Assignment2
//
//  Created by iosdev on 30.3.2021.
//

import Foundation
class IntStack{

    var stackArray = [Double]()
    
    func push(v:Double) {
        self.stackArray.append(v)
    }
    
    func hasTwo() -> Bool {
        if stackArray.count == 2 {
            return true
        }
        else{
            return false
        }
        
    }
    
    func pop() -> Double? {
        return stackArray.popLast()
    }
    
    func printNum(){
        for num in stackArray {
             print(num)
        }
    }
    
    func stackNum() -> Int{
        return stackArray.count
    }
    
    
    
}
