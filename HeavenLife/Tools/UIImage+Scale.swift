//
//  UIImage+Scale.swift
//  HeavenLife
//
//  Created by hosa on 2017/4/17.
//  Copyright © 2017年 Sherlock. All rights reserved.
//

import UIKit



extension UIImage{
    
    func scaleImage() -> UIImage {
//        let data = UIImagePNGRepresentation(self)
//        let dataSize = (data?.count)!/1024
        let width = size.width
        let height = size.height
        var imageSize:CGSize? = size
        if (width > 3000 || height > 3000){
            imageSize = CGSize(width: width/8, height: height/8)
        }else  if (width > 1000 || height > 1000){
            imageSize = CGSize(width: width/4, height: height/4)
        }
        UIGraphicsBeginImageContext(imageSize!);
        self.draw(in: CGRect(x: 0, y: 0, width: (imageSize?.width)!, height: (imageSize?.height)!), blendMode: .normal, alpha: 1)
        let newImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        return newImage!
    }
    
    func scaleNoImage() -> UIImage {
        
        let imageSize:CGSize? = size
        UIGraphicsBeginImageContext(imageSize!);
        self.draw(in: CGRect(x: 0, y: 0, width: (imageSize?.width)!, height: (imageSize?.height)!), blendMode: .normal, alpha: 1)
        let newImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        return newImage!
    }
}


