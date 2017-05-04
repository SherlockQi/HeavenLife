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
        filterName: "美颜",
        filter: nil,
        filterGroup: GPUImageBeautifyFilter(),
        params: []
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
        params: []
    ),
    FilterInfo(
        filterName: "朦胧加暗",
        filter: GPUImageHazeFilter(),
        filterGroup: nil,
        params: []
    ),
    FilterInfo(
        filterName: "卡通",
        filter: GPUImageToonFilter(),
        filterGroup: nil,
        params: []
    ),
    
    FilterInfo(
        filterName: "高斯模糊",
        filter: GPUImageGaussianBlurFilter(),
        filterGroup: nil,
        params: []
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
    ),
    FilterInfo(
        filterName: "Magic",
        filter: nil,
        filterGroup: nil,
        params: []
    )
]



class NEFilterEngine: NSObject {
    
    
    
    
}
