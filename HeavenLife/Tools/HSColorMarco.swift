//
//  HSColorMarco.swift
//  HandHeldGym
//
//  Created by hosa on 2017/4/10.
//  Copyright © 2017年 xiaoyu. All rights reserved.
//

import Foundation
import UIKit
/**
 FE4365
 FC9D9A
 F9CDAD
 CBCBA9
 83AF9B
 */
func kMainGrey() -> UIColor
{
    return ne_color("F0F0F0")
}

func kMainLineColor() -> UIColor
{
    return UIColor(red: 1, green: 1, blue: 1, alpha: 0.15)
}
func kMainColor() -> UIColor
{
    return ne_color("1b2224")
}
func kMainTextColor() -> UIColor
{
    return ne_color("919596")
}

func kRandomColor() -> UIColor
{
    let red = CGFloat(arc4random_uniform(255))/CGFloat(255.0)
    let green = CGFloat( arc4random_uniform(255))/CGFloat(255.0)
    let blue = CGFloat(arc4random_uniform(255))/CGFloat(255.0)
    let color = UIColor.init(red:red, green:green, blue:blue , alpha: 0.3)
    return color
}

func ne_color(_ colorStr:String) -> UIColor {
    
    var color = UIColor.red
    var cStr : String = colorStr.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).uppercased()
    
    if cStr.hasPrefix("#") {
        let index = cStr.index(after: cStr.startIndex)
        cStr = cStr.substring(from: index)
    }
    if cStr.characters.count != 6 {
        return UIColor.black
    }
    
    let rRange = cStr.startIndex ..< cStr.index(cStr.startIndex, offsetBy: 2)
    let rStr = cStr.substring(with: rRange)
    
    let gRange = cStr.index(cStr.startIndex, offsetBy: 2) ..< cStr.index(cStr.startIndex, offsetBy: 4)
    let gStr = cStr.substring(with: gRange)
    
    let bIndex = cStr.index(cStr.endIndex, offsetBy: -2)
    let bStr = cStr.substring(from: bIndex)
    
    var r:CUnsignedInt = 0, g:CUnsignedInt = 0, b:CUnsignedInt = 0;
    Scanner(string: rStr).scanHexInt32(&r)
    Scanner(string: gStr).scanHexInt32(&g)
    Scanner(string: bStr).scanHexInt32(&b)
    
    color = UIColor(red: CGFloat(r) / 255.0, green: CGFloat(g) / 255.0, blue: CGFloat(b) / 255.0, alpha: CGFloat(1))
    
    return color
}
