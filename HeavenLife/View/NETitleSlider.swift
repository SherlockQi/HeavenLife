//
//  NETitleSlider.swift
//  HeavenLife
//
//  Created by hosa on 2017/5/8.
//  Copyright © 2017年 Sherlock. All rights reserved.
//

import UIKit

class NETitleSlider: UIView {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    @IBOutlet weak var paramSlider: UISlider!

  class func slider(filterParam:FilterParam) ->  NETitleSlider{
        let titleSlider  = Bundle.main.loadNibNamed("NETitleSlider", owner: self, options: [:])?.first as! NETitleSlider
        titleSlider.titleLabel.text = filterParam.title
        titleSlider.valueLabel.text = filterParam.defaultValue
        return titleSlider
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
