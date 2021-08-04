//
//  CoolCalBrain.swift
//  CoolCal
//
//  Created by Jose Pimentel on 7/22/21.
//

import UIKit

struct CoolCalBrain {
    
    func updateLabel(label: String, number: String, isAnOparationSet: Bool) -> String {
        
        guard label != "inf" else {return label}
        guard (label.count < 10 || isAnOparationSet) else {return label}
        
        var numberText = label
        
        if number == "D" && (label != "0") {
            numberText += "00"
            
        }
       // i allow this statement to be true when someone is getting the percentage and then enter a number
       else if (label == "0" || isAnOparationSet) && number != "D" {
            
            numberText = number
        }
        
        else if number != "D" {
            
            numberText += number
        }
        
        return numberText
    }
    
    func checkIfIsDoubleOrInt(label: String) -> String {
        
        guard Double(label)! >= 1 else {return label}
        
        var num = label
        
        if num.contains(".0") && num.last == "0" {

            num.removeLast()
            num.removeLast()
        }

        return num
    }
    
    func addDecimal(label: String) -> String {
        
        var numberText = label
        
        if !label.contains(".") {
            
            numberText += "."
        }
        
        return numberText
    }
    
    func getPercentage(label: String) -> String {
        
        guard label != "inf" else {return label}
        
        var labelToReturn = label
        
        guard labelToReturn == "0" else {
            
            let percentageNum = Double(labelToReturn)
            
            labelToReturn = String(percentageNum! / 100)
            
            return labelToReturn
        }
        
        return label
        
    }
    
    func calculation(oparationType: String, number1: Double, number2: Double) -> String {
        
        var result = 0.0
        
        switch oparationType {
        case "+":
            result = (number1 + number2)
        case "-":
            result = (number1 - number2)
        case "*":
            result = (number1 * number2)
        case "/":
            result = (number1 / number2)
        default:
            result = 0.0
        }
        
        return String(result)
    }
}
