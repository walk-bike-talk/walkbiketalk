//
//  LoginTransitionPoP.swift
//  BjRidingProject_iOS
//
//  Created by 刘桂东 on 16/6/17.
//  Copyright © 2016年 gaoming. All rights reserved.
//

import Foundation
import UIKit

class LoginTransitionPop: NSObject, UIViewControllerAnimatedTransitioning{
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return 0.5
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        let fromVC = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey) as! RegisterController
        let toVC = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey) as! LoginController
        let container = transitionContext.containerView()
        
        let phoneImg = fromVC.phoneImg.snapshotViewAfterScreenUpdates(false)
        phoneImg.frame = fromVC.phoneImg.frame
        fromVC.phoneImg.hidden = true
        
        let phoneTextF = fromVC.phoneTextF.snapshotViewAfterScreenUpdates(false)
        phoneTextF.frame = fromVC.phoneTextF.frame
        fromVC.phoneTextF.hidden = true
        
        let phoneLine = fromVC.phoneLine.snapshotViewAfterScreenUpdates(false)
        phoneLine.frame = fromVC.phoneLine.frame
        fromVC.phoneLine.hidden = true
        
        let passwordImg = fromVC.passwordImg.snapshotViewAfterScreenUpdates(false)
        passwordImg.frame = fromVC.passwordImg.frame
        fromVC.passwordImg.hidden = true
        
        let passwordTextF = fromVC.passwordTextF.snapshotViewAfterScreenUpdates(false)
        passwordTextF.frame = fromVC.passwordTextF.frame
        fromVC.passwordTextF.hidden = true
        
        let passwordLine = fromVC.passwordLine.snapshotViewAfterScreenUpdates(false)
        passwordLine.frame = fromVC.passwordLine.frame
        fromVC.passwordLine.hidden = true
        
        let loginBtn = fromVC.registerBtn.snapshotViewAfterScreenUpdates(false)
        loginBtn.frame = fromVC.registerBtn.frame
        fromVC.registerBtn.hidden = true
        
        
        toVC.view.frame = transitionContext.finalFrameForViewController(toVC)
        toVC.phoneImg.alpha = 0
        toVC.phoneTextF.alpha = 0
        toVC.phoneLine.alpha = 0
        toVC.passwordImg.alpha = 0
        toVC.passwordTextF.alpha = 0
        toVC.passwordLine.alpha = 0
        toVC.loginBtn.alpha = 0
        toVC.registerBtn.alpha = 0
        toVC.forgetPwdBtn.alpha = 0
        
        
        
        container?.insertSubview(toVC.view, belowSubview: fromVC.view)
        container!.addSubview(phoneImg)
        container!.addSubview(phoneTextF)
        container!.addSubview(phoneLine)
        container!.addSubview(passwordImg)
        container!.addSubview(passwordTextF)
        container!.addSubview(passwordLine)
        container!.addSubview(loginBtn)
        
        
        
        
        UIView.animateWithDuration(0.5, animations: { 
            phoneImg.frame = toVC.phoneImg.frame
            phoneTextF.frame = toVC.phoneTextF.frame
            phoneLine.frame = toVC.phoneLine.frame
            passwordImg.frame = toVC.passwordImg.frame
            passwordTextF.frame = toVC.passwordTextF.frame
            passwordLine.frame = toVC.passwordLine.frame
            loginBtn.frame = toVC.loginBtn.frame
            fromVC.view.alpha = 0
            
            
            
            }) { (ture) in
                UIView.animateWithDuration(0.8, animations: {
                    toVC.view.alpha = 1
                    toVC.phoneImg.alpha = 1
                    toVC.phoneTextF.alpha = 1
                    toVC.phoneLine.alpha = 1
                    toVC.passwordImg.alpha = 1
                    toVC.passwordTextF.alpha = 1
                    toVC.passwordLine.alpha = 1
                    toVC.loginBtn.alpha = 1
                    toVC.registerBtn.alpha = 1
                    toVC.forgetPwdBtn.alpha = 1
                    phoneTextF.alpha = 0
                    phoneLine.alpha = 0
                    passwordImg.alpha = 0
                    passwordTextF.alpha = 0
                    passwordLine.alpha = 0
                    loginBtn.alpha = 0
                    
                    }, completion: { (ture) in
                        fromVC.phoneImg.hidden = false
                        fromVC.phoneTextF.hidden = false
                        fromVC.phoneLine.hidden = false
                        fromVC.passwordImg.hidden = false
                        fromVC.passwordTextF.hidden = false
                        fromVC.passwordLine.hidden = false
                        fromVC.registerBtn.hidden = false
                        
                        phoneImg.removeFromSuperview()
                        phoneTextF.removeFromSuperview()
                        phoneLine.removeFromSuperview()
                        passwordImg.removeFromSuperview()
                        passwordTextF.removeFromSuperview()
                        passwordLine.removeFromSuperview()
                        loginBtn.removeFromSuperview()
                        
                        transitionContext.completeTransition(!transitionContext.transitionWasCancelled())
                })

        }

    }
    
}
