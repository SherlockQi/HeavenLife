//
//  NEFunctionBar.swift
//  HeavenLife
//
//  Created by hosa on 2017/5/17.
//  Copyright © 2017年 Sherlock. All rights reserved.
//

import UIKit

class NEFunctionBar: UIView {

    lazy var soarButton: NESoarButton = {
        let width:CGFloat = 45
        let height = width
        let rect = CGRect(x: kScreenWidth() - width, y: 0, width: width, height: height)
        let btn = NESoarButton(frame: rect)
        btn.backgroundColor = .blue
        
        btn.addcornerRadius()
        btn.addBorder(color: .white, borderWidth: 2)
        return btn
    }()
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .red
        addSubview(soarButton)
        
        
    }
    
    

    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

class NESoarButton: UIButton {
    
    
}
