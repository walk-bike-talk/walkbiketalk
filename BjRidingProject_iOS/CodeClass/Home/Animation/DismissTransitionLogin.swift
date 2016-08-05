//
//  DismissTransitionLogin.swift
//  BjRidingProject_iOS
//
//  Created by 刘桂东 on 16/6/16.
//  Copyright © 2016年 gaoming. All rights reserved.
//

import Foundation
import UIKit

class DismissTransitionLogin: NSObject,UIViewControllerAnimatedTransitioning {
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return 1
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        let fromVc = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)
        let toVc = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)
        transitionContext.containerView()!.addSubview(toVc!.view)
        fromVc?.view.alpha = 1

        UIView.animateWithDuration(self.transitionDuration(transitionContext), animations: { 
            fromVc?.view.alpha = 0
            toVc?.view.alpha = 1
            }) { (ture) in
                transitionContext.completeTransition(!transitionContext.transitionWasCancelled())
        }
    }
}