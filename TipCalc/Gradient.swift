//
//  Gradient.swift
//  TipCalc
//
//  Created by Caner Kaya on 29.12.19.
//  Copyright © 2019 lll. All rights reserved.
//

import UIKit

extension UILabel
{
    func setGradient(FirstColor: UIColor, SecondColor: UIColor)
    {
        let gradientLayer = CAGradientLayer()
        
        gradientLayer.frame = bounds
        
        gradientLayer.colors = [FirstColor.cgColor, SecondColor.cgColor]
        
        gradientLayer.locations = [0.0, 1.0]
        
        gradientLayer.startPoint = CGPoint(x: 1.0, y: 0.0)
        
        gradientLayer.endPoint = CGPoint(x: 0.0, y: 0.0)
        
        layer.insertSublayer(gradientLayer, at: 0)
    }
}
