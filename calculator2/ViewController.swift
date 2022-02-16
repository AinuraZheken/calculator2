//
//  ViewController.swift
//  calculator2
//
//  Created by Zhanibek Baktygali on 2/12/22.
//

import UIKit

class ViewController: UIViewController {
    
    var numberFromScreen:Double = 0
    var firstNumber:Double = 0
    var mathSign:Bool = false
    var operation:Int = 0
    var secondNumber:Double = 0
    
    
    @IBOutlet weak var result: UILabel!
   
    @IBAction func digits(_ sender: UIButton) {
        if mathSign == true{
            result.text = String(sender.tag)
            mathSign = false
        }
        else {
            result.text = result.text! + String(sender.tag)
        }
    }
        
    @IBAction func buttons(_ sender: UIButton) {
    
        numberFromScreen = Double(result.text!)!
        
        sender.alpha = 0.5
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
             //Bring's sender's opacity back up to fully opaque.
             sender.alpha = 1.0
            
    }
    
    
        
        if result.text != "" && sender.tag != 12 && sender.tag != 17
        
        {
            firstNumber = Double(result.text!)!
            
            if sender.tag == 13 {// divide
                result.text = "÷"
            }
            else if sender.tag == 14 {// mulitply
                result.text = "×"
            }
            else if sender.tag == 15 {// substract
                result.text = "-"
            }
            else if sender.tag == 16 {// add
                result.text = "+"
            }
//            else if sender.tag == 10 {
//                result.text = "%"
//            }
            operation = sender.tag
            mathSign = true
        }
        else if sender.tag == 17 { //math results
            if operation == 13 {
                result.text = String(firstNumber / numberFromScreen)
                
            }
            else if operation == 14 {
                result.text = String(firstNumber * numberFromScreen)
            }
            else if operation == 15 {
                result.text = String(firstNumber - numberFromScreen)
            }
            else if operation == 16 {
                result.text = String(firstNumber + numberFromScreen)
            }
//            else if operation == 10 {
//                result.text = String(firstNumber/100)
//            }
            
        }
        
        else if sender.tag == 12{
            result.text = ""
            firstNumber = 0
            numberFromScreen = 0
            operation = 0
        }
        
        sender.alpha = 0.5
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
             //Bring's sender's opacity back up to fully opaque.
             sender.alpha = 1.0
    }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}



