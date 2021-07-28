//
//  ViewController.swift
//  CoolCal
//
//  Created by Jose Pimentel on 7/20/21.
//

import UIKit

class CalViewController: UIViewController {

    @IBOutlet weak var numLabel: UILabel!
    @IBOutlet weak var equationLabel: UILabel!
    @IBOutlet weak var aCLbl: CircleButton!
    
    var oparation: String?
    var numberInput = 0.0
    var isAnOparationSet = true
    var cal = CoolCalBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        overrideUserInterfaceStyle = .dark
        equationLabel.adjustsFontSizeToFitWidth = true
        equationLabel.minimumScaleFactor = 0.5
        numLabel.adjustsFontSizeToFitWidth = true
        numLabel.minimumScaleFactor = 0.5
    }
    
    func updateEquationLabel() {
        
        guard numLabel.text != "inf" else {return}
        
        equationLabel.text = "\(cal.checkIfIsDoubleOrInt(label: String(numberInput))) \(oparation!) \(numLabel.text!)"

        
        equationLabel.textColor = UIColor.white
    }
    
    func setOparation() {
        
        guard numLabel.text != "inf" else {return}
        
        //oparation = "*"
        if oparation == nil {
            
            numberInput = Double(numLabel.text!)!
        }
        // check if an else if statemant is possible here
        else if !isAnOparationSet {
    
            let label = cal.calculation(oparationType: oparation!, number1: numberInput, number2: Double(numLabel.text!)!)
            updateEquationLabel()
            numLabel.text = cal.checkIfIsDoubleOrInt(label: label)
            numLabel.sizeToFit()
            numberInput = Double(numLabel.text!)!
        }
        
        isAnOparationSet = true
    }
    
    @IBAction func acButton(_ sender: UIButton) {
        
        if aCLbl.currentTitle == "AC" {
            
            numLabel.text = "0"
            numberInput = 0
            oparation = nil
            equationLabel.textColor = UIColor.black
        }
        
        else {
            
            numLabel.text = "0"
            
            aCLbl.setTitle("AC", for: .normal)
        }
    }
    
    @IBAction func minusBtn(_ sender: UIButton) {
        
        guard numLabel.text != "0" else {return}
        
        if numLabel.text?.first == "-" {
            
            numLabel.text?.removeFirst()
        }
        
        else {
            
            let negative = "-" + numLabel.text!
            
            numLabel.text = negative
        }
        
    }
    
    @IBAction func percentageBtn(_ sender: UIButton) {
        
        if numberInput == 0.0 {
            
            numberInput = Double(cal.getPercentage(label: numLabel.text!))!
        }
        else {
            
            numberInput = Double(cal.getPercentage(label: String(numberInput)))!
        }

        var label = String(numberInput)
        
        label = cal.checkIfIsDoubleOrInt(label: String(numberInput))
        
        let i = label.index(label.startIndex, offsetBy: 2)
        
        if Double(label)! < 1 && label.contains("e"){
            
            while (label.contains(".") && label.count > 5) {
                
                label.remove(at: i)
                
                if label.count == 6 && label.contains(".") {
                    
                    label.remove(at: label.index(label.startIndex, offsetBy: 1))
                }
                
                if !(label.contains("e")) {
                    
                    label.insert("e", at: label.index(label.startIndex, offsetBy: 1))
                }
            }
        }
        
        numLabel.text = label
    }
    
    @IBAction func sevenBtn(_ sender: UIButton) {
        
        numLabel.text = cal.updateLabel(label: numLabel.text!, number: String(7), isAnOparationSet: isAnOparationSet)
        
        aCLbl.setTitle("C", for: .normal)
        isAnOparationSet = false
    }
    
    @IBAction func eightBtn(_ sender: UIButton) {
        
        numLabel.text = cal.updateLabel(label: numLabel.text!, number: String(8), isAnOparationSet: isAnOparationSet)
        
        aCLbl.setTitle("C", for: .normal)
        isAnOparationSet = false
    }
    
    @IBAction func nineBtn(_ sender: UIButton) {
        
        numLabel.text = cal.updateLabel(label: numLabel.text!, number: String(9), isAnOparationSet: isAnOparationSet)
        
        aCLbl.setTitle("C", for: .normal)
        isAnOparationSet = false
    }
    
    @IBAction func fourBtn(_ sender: UIButton) {
        
        numLabel.text = cal.updateLabel(label: numLabel.text!, number: String(4), isAnOparationSet: isAnOparationSet)
        
        aCLbl.setTitle("C", for: .normal)
        isAnOparationSet = false
    }
    
    @IBAction func fiveBtn(_ sender: UIButton) {
        
        numLabel.text = cal.updateLabel(label: numLabel.text!, number: String(5), isAnOparationSet: isAnOparationSet)
        
        aCLbl.setTitle("C", for: .normal)
        isAnOparationSet = false
    }
    
    @IBAction func sixBtn(_ sender: UIButton) {
        
        numLabel.text = cal.updateLabel(label: numLabel.text!, number: String(6), isAnOparationSet: isAnOparationSet)
        
        aCLbl.setTitle("C", for: .normal)
        isAnOparationSet = false
    }
    
    @IBAction func oneBtn(_ sender: UIButton) {
        
        numLabel.text = cal.updateLabel(label: numLabel.text!, number: String(1), isAnOparationSet: isAnOparationSet)
        
        aCLbl.setTitle("C", for: .normal)
        isAnOparationSet = false
    }
    
    @IBAction func twoBtn(_ sender: UIButton) {
        
        numLabel.text = cal.updateLabel(label: numLabel.text!, number: String(2), isAnOparationSet: isAnOparationSet)
        
        aCLbl.setTitle("C", for: .normal)
        isAnOparationSet = false
    }
    
    @IBAction func threeBtn(_ sender: UIButton) {
        
        numLabel.text = cal.updateLabel(label: numLabel.text!, number: String(3), isAnOparationSet: isAnOparationSet)
        
        aCLbl.setTitle("C", for: .normal)
        isAnOparationSet = false
    }
    
    @IBAction func pointBtn(_ sender: UIButton) {
        
        isAnOparationSet = false
        numLabel.text = cal.addDecimal(label: numLabel.text!)
        aCLbl.setTitle("C", for: .normal)
    }
    
    @IBAction func zeroBtn(_ sender: UIButton) {
        
        numLabel.text = cal.updateLabel(label: numLabel.text!, number: String(0), isAnOparationSet: isAnOparationSet)
        
        aCLbl.setTitle("C", for: .normal)
        isAnOparationSet = false
    }
    
    @IBAction func doubleZseroBtn(_ sender: UIButton) {
        
        numLabel.text = cal.updateLabel(label: numLabel.text!, number: "D", isAnOparationSet: isAnOparationSet)
        
        aCLbl.setTitle("C", for: .normal)
        isAnOparationSet = false
    }
    
    @IBAction func multiplicationBtn(_ sender: UIButton) {
        
        setOparation()
        oparation = "*"
    }
    
    @IBAction func divisionBtn(_ sender: UIButton) {
        
        setOparation()
        oparation = "/"
    }
    
    @IBAction func subtractionBtn(_ sender: UIButton) {
        
        setOparation()
        oparation = "-"
    }
    
    @IBAction func addingBtn(_ sender: UIButton) {
        
        setOparation()
        oparation = "+"
    }
    
    @IBAction func equalBtn(_ sender: UIButton) {
        
        guard !(oparation == nil) else {return}
        
        let result = cal.calculation(oparationType: oparation!, number1: numberInput, number2: Double(numLabel.text!)!)
        
        updateEquationLabel()
        
        numberInput = Double(result)!
            
        numLabel.text = cal.checkIfIsDoubleOrInt(label: result)
        
        isAnOparationSet = true
    }
    
}
