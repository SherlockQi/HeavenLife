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
}
