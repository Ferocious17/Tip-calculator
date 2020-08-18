//
//  ViewController.swift
//  TipCalc
//
//  Created by Caner Kaya on 28.12.19.
//  Copyright © 2019 lll. All rights reserved.
//

import UIKit

var tip: Float = 0.0

var last: Float = 0.0

var invoice: Float = 0.0

var percentage: Float = 1

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var buttonOutlet: UIButton!
    
    @IBOutlet weak var pickerView: UIPickerView!
    
    @IBOutlet weak var decoration1: UILabel!
    
    @IBOutlet weak var decoration2: UILabel!
    
    let percentages = ["1 %", "2 %", "3 %", "4 %", "5 %", "6 %", "7 %", "8 %", "9 %", "10 %", "20 %", "30 %"]
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int
    {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
    {
        return percentages[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
        return percentages.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        let modified = percentages[row].replacingOccurrences(of: " %", with: "")
        
        percentage = Float(modified)!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        pickerView.dataSource = self
        
        pickerView.delegate = self
        
        textField.placeholder = "invoice"
        
        buttonOutlet.layer.cornerRadius = 9
        
        buttonOutlet.setTitle("Calculate", for: .normal)
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(keyboard))
        
        view.addGestureRecognizer(tap)
        
        self.textField.keyboardType = .numberPad
        
        textField.text = ""
        
        decoration1.transform = CGAffineTransform(rotationAngle: .pi/4)
        
        decoration1.setGradient(FirstColor: Colors.darkYellow, SecondColor: Colors.darkGreen)
        
        decoration2.transform = CGAffineTransform(rotationAngle: .pi/4)
        
        decoration2.setGradient(FirstColor: Colors.pink, SecondColor: Colors.violet)
    }
    
    @objc func keyboard()
    {
        view.endEditing(true)
    }

    @IBAction func button(_ sender: Any)
    {
        if textField.text == ""
        {
            let alert = UIAlertController(title: "Alert", message: "Please enter an invoice", preferredStyle: .actionSheet)
            
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action) in
                self.textField.becomeFirstResponder()
            }))
            
            alert.addAction(UIAlertAction(title: "Exit", style: .destructive, handler: { (action) in
                exit(0)
            }))
            
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            
            self.present(alert, animated: true, completion: nil)
        }
        else
        {
            invoice = Float(textField.text!)!
        
            tip = invoice * (percentage / 100)
            
            last = invoice + tip
            
            performSegue(withIdentifier: "segue", sender: SecondViewController())
        }
    }
    
}
