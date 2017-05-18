//
//  UIView+NEPlus.swift
//  HeavenLife
//
//  Created by hosa on 2017/4/18.
//  Copyright © 2017年 Sherlock. All rights reserved.
//

import UIKit

extension UIView{
    //添加缩放手势
    func  addZoomScalePinch(view:UIView) {
    view.isUserInteractionEnabled = true
    let pinchGesture = UIPinchGestureRecognizer(target: view, action: #selector(UIView.viewZoomScale))
    view.addGestureRecognizer(pinchGesture)

    }
    func viewZoomScale(pinch:UIPinchGestureRecognizer){
        let factor = pinch.scale
        self.transform = CGAffineTransform(scaleX: factor, y: factor)
        self.transform = CGAffineTransform(scaleX: factor, y: factor)
    }
    
    //移除全部子控件
    func removeAllSubview(){
        for subview in subviews {
            subview.removeFromSuperview()
        }
    }
    //加圆角
    func addcornerRadius(radius:CGFloat? = nil){
        layer.cornerRadius = radius ?? width * 0.5
        layer.masksToBounds = true
    }
    //加边框
    func addBorder(color:UIColor,borderWidth:CGFloat? = nil){
        layer.borderWidth = borderWidth ?? 1
        layer.borderColor = color.cgColor
    }
}

extension UIView{


    
    
    
    
}






