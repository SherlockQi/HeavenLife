//
//  NETitleSlider.swift
//  HeavenLife
//
//  Created by hosa on 2017/5/8.
//  Copyright © 2017年 Sherlock. All rights reserved.
//

import UIKit
protocol NETitleSliderDelegate {
    func titleSliderSlid(newValue:CGFloat,paramKey:String)
}

class NETitleSlider: UIView {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    @IBOutlet weak var paramSlider: UISlider!
    
    var delegate:NETitleSliderDelegate?
    
    class func slider(filterParam:FilterParam) ->  NETitleSlider{
        let titleSlider  = Bundle.main.loadNibNamed("NETitleSlider", owner: self, options: [:])?.first as! NETitleSlider
        titleSlider.titleLabel.text = filterParam.title
        titleSlider.valueLabel.text = filterParam.defaultValue
        
        titleSlider.paramSlider.value = 0
        if let defaultValue = filterParam.defaultValue {
        titleSlider.paramSlider.value = Float(defaultValue)!
        }
        titleSlider.paramSlider.maximumValue = Float(filterParam.maxValue)!
        titleSlider.paramSlider.minimumValue = Float(filterParam.minValue)!
        
        print(titleSlider)
        return titleSlider
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        print(self.paramSlider)
        
                paramSlider.addTarget(self, action: #selector(NETitleSlider.sliderValueDidChange), for: .valueChanged)
    }
    
    func sliderValueDidChange(){
        
        valueLabel.text = String(format: "%.4f", paramSlider.value)
        self.delegate?.titleSliderSlid(newValue: CGFloat(paramSlider.value), paramKey: titleLabel.text!)
    }
}
