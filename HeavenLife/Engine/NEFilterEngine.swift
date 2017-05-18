//
//  NEFilterEngine.swift
//  HeavenLife
//
//  Created by hosa on 2017/5/3.
//  Copyright © 2017年 Sherlock. All rights reserved.
//

import UIKit
import GPUImage

let filterInfoS = [
    
    FilterInfo(
        filterName: "原图",
        filter: nil,
        filterGroup: nil,
        params: []
    ),
    FilterInfo(
        filterName: "美颜",
        filter: nil,
        filterGroup: GPUImageBeautifyFilter(),
        params: [/*FilterParam(title: "intensity", defaultValue: nil, minValue: "0", maxValue: "0.05")*/]
    ),
    FilterInfo(
        filterName: "怀旧",
        filter: GPUImageSepiaFilter(),
        filterGroup: nil,
        params: []
    ),
    FilterInfo(
        filterName: "素描",
        filter: GPUImageSketchFilter(),
        filterGroup: nil,
        params: [
            FilterParam(title: "texelWidth", defaultValue: nil, minValue: "0", maxValue: "0.05"),
            FilterParam(title: "texelHeight", defaultValue: nil, minValue: "0", maxValue: "0.05"),
            FilterParam(title: "edgeStrength", defaultValue: "1.0", minValue: "0", maxValue: "5.0")
        ]
    ),

    FilterInfo(
        filterName: "朦胧加暗",
        filter: GPUImageHazeFilter(),
        filterGroup: nil,
        params: [
            /**
             颜色强度
             */
        FilterParam(title: "distance", defaultValue: "0.2", minValue: "-.3", maxValue: ".3"),
            /**
            颜色的数量?
             */
        FilterParam(title: "slope", defaultValue: "0.0", minValue: "-.3", maxValue: ".3")
        ]
        
        

    ),
    FilterInfo(
        filterName: "卡通",
        filter: GPUImageToonFilter(),
        filterGroup: nil,
        params: [
            FilterParam(title: "threshold", defaultValue: "0.2", minValue: "0", maxValue: "2"),
            FilterParam(title: "quantizationLevels", defaultValue: "0", minValue: "0", maxValue: "1")
        ]
    ),
    
    FilterInfo(
        filterName: "高斯模糊",
        filter: GPUImageGaussianBlurFilter(),
        filterGroup: nil,
        params: []
    ),
    FilterInfo(
        filterName: "颜色",
        filter: GPUImageMonochromeFilter(),
        filterGroup: nil,
        params: [
        FilterParam(title: "intensity", defaultValue: "0", minValue: "0", maxValue: "1"),
        FilterParam(title: "1", defaultValue: "0.2", minValue: "0", maxValue: "2"),
        FilterParam(title: "2", defaultValue: "0.2", minValue: "0", maxValue: "2"),
        FilterParam(title: "3", defaultValue: "0.2", minValue: "0", maxValue: "2"),
        ]
    ),
    FilterInfo(
        filterName: "Magic",
        filter: nil,
        filterGroup: nil,
        params: []
    ),
    FilterInfo(
        filterName: "Magic",
        filter: nil,
        filterGroup: nil,
        params: []
    )
]



class NEFilterEngine: NSObject {
    

//    func ss()  {
//        let  filter = GPUImageMonochromeFilter()
        
//        filter.setColorRed(<#T##redComponent: GLfloat##GLfloat#>, green: <#T##GLfloat#>, blue: <#T##GLfloat#>)
        
        
        
//        [(GPUImageMonochromeFilter *)filter setColor:(GPUVector4){0.0f, 0.0f, 1.0f, 1.f}];
        
        
        
//    }

    
    
}
