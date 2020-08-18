//
//  SecondViewController.swift
//  TipCalc
//
//  Created by Caner Kaya on 28.12.19.
//  Copyright © 2019 lll. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var buttonOutlet: UIButton!
    
    @IBOutlet weak var lastLabel: UILabel!
    
    @IBOutlet weak var message: UILabel!
    
    @IBOutlet weak var decoration1: UILabel!
    
    @IBOutlet weak var decoration2: UILabel!
    
    @IBOutlet weak var decoration3: UILabel!
    
    @IBOutlet weak var decoration4: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    
        buttonOutlet.setTitle("Back", for: .normal)
        
        lastLabel.textAlignment = .right
        
        message.textAlignment = .center
        
        let modifiedTip = roundToTwo(Number: tip)
        
        message.text = "Tip: \(percentage)%, \(modifiedTip) - Pay:"
        
        let modifiedLast = roundToTwo(Number: last)
        
        lastLabel.text = "\(modifiedLast)"
        
        //alignment of decoration-labels
        decoration1.transform = CGAffineTransform(rotationAngle: -.pi/4)
        
        decoration1.setGradient(FirstColor: Colors.turquoise, SecondColor: Colors.lightGreen)
        
        decoration2.transform = CGAffineTransform(rotationAngle: -.pi/4)
        
        decoration2.setGradient(FirstColor: Colors.lightBlue, SecondColor: Colors.darkBlue)
        
        decoration3.transform = CGAffineTransform(rotationAngle: -.pi/4)
        
        decoration3.setGradient(FirstColor: Colors.purple, SecondColor: Colors.violet)
        
        decoration4.transform = CGAffineTransform(rotationAngle: -.pi/4)
        
        decoration4.setGradient(FirstColor: Colors.darkYellow, SecondColor: Colors.pink)
    }

    @IBAction func button(_ sender: Any)
    {
        self.view.window?.rootViewController?.dismiss(animated: true, completion: nil)
    }
    
    func roundToTwo(Number: Float) -> Float
    {
        return (Number * 100).rounded() / 100
    }
}
