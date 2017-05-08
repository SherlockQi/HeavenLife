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
        params: [
            FilterParam(title: "texelWidth", defaultValue: "1", minValue: "0", taxValuetle: "1"),
            FilterParam(title: "texelHeight", defaultValue: "1", minValue: "0", taxValuetle: "1"),
            FilterParam(title: "edgeStrength", defaultValue: "1.0", minValue: "0", taxValuetle: "1")
        ]
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
