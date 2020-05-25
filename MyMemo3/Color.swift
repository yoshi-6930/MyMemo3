//
//  Color.swift
//  MyMemo3
//
//  Created by 岩元喜輝 on 2020/05/25.
//  Copyright © 2020 Yoshiki Iwamoto. All rights reserved.
//

import Foundation
import UIKit

class ChangeColor{
    
    
    func changeColor(topR:CGFloat,topG:CGFloat,topB:CGFloat,topAlpha:CGFloat,
                     bottomR:CGFloat,bottomG:CGFloat,bottomB:CGFloat,bottomAlpha:CGFloat)->CAGradientLayer{
        
        //グラデーションの開始色
        let topColor = UIColor(red: topR, green: topG, blue: topB, alpha: topAlpha)
        
        let bottomColor = UIColor(red: bottomR, green:bottomG , blue: bottomB, alpha: bottomAlpha)
        
        
        let gradientColor = [topColor.cgColor,bottomColor.cgColor]
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = gradientColor
        return gradientLayer
    }
}

