//
//  RegisterAnimation.swift
//  BjRidingProject_iOS
//
//  Created by 汪高明 on 16/6/18.
//  Copyright © 2016年 gaoming. All rights reserved.
//

import Foundation
import UIKit
import NVActivityIndicatorView

class RegisterAnimation:NSObject{
    var i = 1
    var timer = NSTimer()
    var btn:UIButton! = nil
    var activityIndicatorView:NVActivityIndicatorView! = nil
    
    class func sendBtnWithAnimation(btn:UIButton,view:UIView){
        let ra = RegisterAnimation.init()
        ra.btn = btn
        
        let animation = CABasicAnimation(keyPath: "transform.scale")
        animation.duration = 0.8;
        animation.repeatCount = 1;
        
        animation.fromValue = NSNumber(float: 1)
        animation.toValue = NSNumber(float: 0)
        animation.timingFunction = CAMediaTimingFunction(controlPoints: 0.23, 1.3, 0.7, 1.06)
        animation.removedOnCompletion = false;
        animation.fillMode = kCAFillModeForwards;
        btn.layer.addAnimation(animation, forKey: "scale-layer")
        
        UIView.animateWithDuration(0.8, animations: {
            btn.alpha = 0
            
        }) { (ture) in
            
            ra.activityIndicatorView = NVActivityIndicatorView(frame:btn.frame , type: NVActivityIndicatorType.BallScaleMultiple, color: ToolClass.greenColor(), padding: 0)
            
            view.addSubview(ra.activityIndicatorView)
            
            ra.activityIndicatorView.startAnimation()
            
            ra.timer = NSTimer.scheduledTimerWithTimeInterval(1, target: ra, selector: #selector(ra.timing), userInfo: nil, repeats: true)
        }
    }
    
    
    func timing(){
        i += 1
        print(i)
        if i>5 {
            timer.invalidate()
            activityIndicatorView.stopAnimation()
            self.reductionAnimation()
        }
        
    }
    
    func reductionAnimation(){
        btn.alpha = 1
        let animation = CABasicAnimation(keyPath: "transform.scale")
        animation.duration = 0.8;
        animation.repeatCount = 1;
        
        animation.fromValue = NSNumber(float: 0)
        animation.toValue = NSNumber(float: 1)
        animation.timingFunction = CAMediaTimingFunction(controlPoints: 0.23, 1.3, 0.7, 1.06)
        animation.removedOnCompletion = false;
        animation.fillMode = kCAFillModeForwards;
        btn.layer.addAnimation(animation, forKey: "scale-layer")
    }
}