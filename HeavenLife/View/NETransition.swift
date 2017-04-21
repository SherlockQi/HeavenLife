//
//  NETransition.swift
//  HeavenLife
//
//  Created by hosa on 2017/4/17.
//  Copyright © 2017年 Sherlock. All rights reserved.
//

import UIKit

class NETransition: NSObject,UIViewControllerAnimatedTransitioning {
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.75
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        presentAnimateTransition(using: transitionContext)
    }
    
    
    func  presentAnimateTransition(using transitionContext: UIViewControllerContextTransitioning){
        
        let containView = transitionContext.containerView
        let toView = transitionContext.view(forKey:.to)
        containView.addSubview(toView!)
        toView!.alpha = 0.0
        UIView.animate(withDuration: transitionDuration(using: transitionContext), animations: {
            toView!.alpha = 1.0
        }) { (finished) in
            transitionContext.completeTransition(finished)
        }
    }
}




