//
//  NEMagicImageEngine.swift
//  HeavenLife
//
//  Created by hosa on 2017/4/14.
//  Copyright © 2017年 Sherlock. All rights reserved.
//

import UIKit
import GPUImage

@objc protocol NEMagicImageEngineDelegate {
    @objc optional func NEMagicImageEngineDelegate (magicComplete image: UIImage)
}

class NEMagicImageEngine: NSObject {
    
    var delegate:NEMagicImageEngineDelegate? = nil
    
    
    func magicImage(image:UIImage, indexPath:NSIndexPath) {
        var newImage:UIImage = image.copy() as! UIImage
        
        switch indexPath.row {
        case 0:
            break
        case 1:
            newImage =  NEMagicImageEngine.imageGaussianSelectiveBlurFilter(image: newImage)
        case 2:
            newImage =  NEMagicImageEngine.imageSepiaFilter(image: newImage)
        case 3:
            newImage =  NEMagicImageEngine.imageSketchFilter(image: newImage)
        case 4:
            newImage =  NEMagicImageEngine.imageBeautyFilter(image: newImage)
        case 5:
            newImage =  NEMagicImageEngine.imageToonFilter(image: newImage)
            
        case 6:
            newImage =  NEMagicImageEngine.imageHazeFilter(image: newImage)
        case 7:
            newImage = NEMagicImageEngine.imageGaussianBlurFilter(image: newImage)
        case 8:
            newImage =  NEMagicImageEngine.imageSketchFilter(image: newImage)
        case 9:
            newImage =  NEMagicImageEngine.imageSketchFilter(image: newImage)
        case 10:
            newImage =  NEMagicImageEngine.imageSketchFilter(image: newImage)
        case 11:
            newImage =  NEMagicImageEngine.imageSketchFilter(image: newImage)
        case 12:
            newImage =  NEMagicImageEngine.imageSketchFilter(image: newImage)
        case 13:
            newImage =  NEMagicImageEngine.imageSketchFilter(image: newImage)
        case 14:
            newImage =  NEMagicImageEngine.imageSketchFilter(image: newImage)
        case 15:
            newImage =  NEMagicImageEngine.imageSketchFilter(image: newImage)
        case 16:
            newImage =  NEMagicImageEngine.imageSketchFilter(image: newImage)
        default: break
            
        }
        self.delegate?.NEMagicImageEngineDelegate!(magicComplete: newImage)
    }
}

//返回图片
extension NEMagicImageEngine{
    /**
     0.无
     */
    
    /**
     1.部分高斯
     */
    class func imageGaussianSelectiveBlurFilter(image:UIImage) -> UIImage {
        
        let filter = GPUImageGaussianSelectiveBlurFilter()
        filter.useNextFrameForImageCapture()
        //半径
        filter.excludeCircleRadius = 0.3;
        //圆心
        filter.excludeCirclePoint = CGPoint(x: 0.5, y: 0.5)
        let source = GPUImagePicture(image: image)
        source?.addTarget(filter)
        source?.processImage()
        let newImage = filter.imageFromCurrentFramebuffer()
        return newImage!
    }
    
    /**
     2.怀旧
     */
    class func imageSepiaFilter(image:UIImage) -> UIImage {
        
        let filter = GPUImageSepiaFilter()
        filter.useNextFrameForImageCapture()
        let source = GPUImagePicture(image: image)
        source?.addTarget(filter)
        source?.processImage()
        let newImage = filter.imageFromCurrentFramebuffer()
        return newImage!
    }
    
    
    /**
     3.素描
     */
    class func imageSketchFilter(image:UIImage) -> UIImage {
        
        let filter = GPUImageSketchFilter()
        filter.useNextFrameForImageCapture()
        
        let source = GPUImagePicture(image: image)
        source?.addTarget(filter)
        source?.processImage()
        let newImage = filter.imageFromCurrentFramebuffer()
        
        return newImage!
    }
    
    /**
     4.美颜
     */
    class func imageBeautyFilter(image:UIImage) -> UIImage {
        
        let filter = GPUImageBeautifyFilter()
        filter.useNextFrameForImageCapture()
        let source = GPUImagePicture(image: image)
        source?.addTarget(filter)
        source?.processImage()
        let newImage = filter.imageFromCurrentFramebuffer()
        return newImage!
    }
    
    /**
     5.卡通
     */
    class func imageToonFilter(image:UIImage) -> UIImage {
        
        let filter = GPUImageToonFilter()
        filter.useNextFrameForImageCapture()
        let source = GPUImagePicture(image: image)
        source?.addTarget(filter)
        source?.processImage()
        let newImage = filter.imageFromCurrentFramebuffer()
        return newImage!
    }
    
    /**
     6.朦胧加暗
     */
    class func imageHazeFilter(image:UIImage) -> UIImage {
        
        let filter = GPUImageHazeFilter()
        filter.useNextFrameForImageCapture()
        let source = GPUImagePicture(image: image)
        source?.addTarget(filter)
        source?.processImage()
        let newImage = filter.imageFromCurrentFramebuffer()
        return newImage!
    }
    /**
     7.高斯模糊
     */
    class func imageGaussianBlurFilter(image:UIImage) -> UIImage {
        
        let filter = GPUImageGaussianBlurFilter()
        filter.useNextFrameForImageCapture()
        let source = GPUImagePicture(image: image)
        source?.addTarget(filter)
        source?.processImage()
        let newImage = filter.imageFromCurrentFramebuffer()
        return newImage!
        
    }
    
}




//返回滤镜
extension NEMagicImageEngine{
    
   class func magicFilterInfo(index:Int)-> FilterInfo?{
        var filter:GPUImageFilter?
        var paras:[String]?
        
        switch index {
        case 0:
            paras = ["0000","0000","0000"]
        case 1:
            paras = ["1111","1111","1111"]
        case 2:
            filter = GPUImageSepiaFilter()
            paras = ["2222","2222","2222"]
        case 3:
            filter = GPUImageSketchFilter()
            paras = ["3333","3333","3333"]
        case 4:
            paras = ["4444","4444","4444"]
        case 5:
            filter = GPUImageToonFilter()
            paras = ["5555","5555","5555"]
        case 6:
            filter = GPUImageHazeFilter()
            paras = ["6666","6666","6666"]
        case 7:
            filter = GPUImageGaussianBlurFilter()
            paras = ["7777","7777","7777"]
        default:
            filter = GPUImageSketchFilter()
            paras = ["default","default"]
        }
        
        let filterInfo = FilterInfo(filterName: "----", filter: filter, filterGroup: nil, params: paras!)
        return filterInfo
    }
}





