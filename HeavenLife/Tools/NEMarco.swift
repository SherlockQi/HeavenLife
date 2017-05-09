//
//  NEMarco.swift
//  HeavenLife
//
//  Created by hosa on 2017/4/18.
//  Copyright © 2017年 Sherlock. All rights reserved.
//

import UIKit

func kScreenWidth() -> CGFloat{
    return UIScreen.main.bounds.size.width
}

func kScreenHeight() -> CGFloat{
    return UIScreen.main.bounds.size.height
}

//MARK: struct
struct FilterInfo {
    ///名称
    var filterName  : String
    ///单
    var filter      : GPUImageFilter?
    ///组
    var filterGroup : GPUImageFilterGroup?
    ///参数
    var params      : [FilterParam]?
}


struct FilterParam {
    ///参数名
    var title        : String
    ///默认值
    var defaultValue : String?
    ///最小值
    var minValue     : String
    ///最大值
    var maxValue     : String
}


//MARK: enum





