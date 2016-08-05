//
//  HomeAnimationUtil.swift
//  BjRidingProject_iOS
//
//  Created by 刘桂东 on 16/6/15.
//  Copyright © 2016年 gaoming. All rights reserved.
//

import Foundation
import UIKit

class HomeAnimationUtil {
    
    
    
    class func headerImgAnimationWithImage(headerImg:UIButton,nameL:UILabel,contentL:UILabel,notiBtn:UIButton,sexImg:UIImageView) {
        
        let animation = CAKeyframeAnimation();
        animation.keyPath = "transform.rotation"
        animation.values = [-10/180*M_PI,10/180*M_PI,-10/180*M_PI]
        animation.repeatCount = 12
        animation.duration = 0.1
        notiBtn.layer.addAnimation(animation, forKey: nil)
        
        UIView.animateWithDuration(1.6, animations: {
            headerImg.alpha = 1
            sexImg.alpha = 1
            
            nameL.transform = CGAffineTransformIdentity
            nameL.alpha = 1
            contentL.transform = CGAffineTransformIdentity
            contentL.alpha = 1
        })
    }
    
    class func btnAnimation(btns:NSArray){
        
        UIView.animateWithDuration(2.5, animations: {
            for bt in btns{
                let btn = bt as! UIButton
                btn.alpha = 1
            }
        })
        
        for bt in btns {
            
            //1.绕中心圆移动 Circle move
            let pathAnimation = CAKeyframeAnimation(keyPath: "position")
            pathAnimation.calculationMode = kCAAnimationPaced
            pathAnimation.fillMode = kCAFillModeForwards
            pathAnimation.removedOnCompletion = false
            pathAnimation.repeatCount = Float.infinity
            pathAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
            pathAnimation.duration = Double(arc4random()%6+2)
            
            
            let curvedPath = CGPathCreateMutable()
            let circleContainer = CGRectInset(bt.frame, bt.frame.size.width/2-3, bt.frame.size.width/2-3)
            CGPathAddEllipseInRect(curvedPath, nil, circleContainer)
            pathAnimation.path = curvedPath
            bt.layer.addAnimation(pathAnimation, forKey: "myCircleAnimation")
            
            
            //2.X方向上的缩放 scale in X
            let scaleX = CAKeyframeAnimation(keyPath:"transform.scale.x")
            scaleX.values   =  [1.0, 1.1, 1.0]
            scaleX.keyTimes =  [0.0, 0.5,1.0]
            scaleX.repeatCount = Float.infinity
            scaleX.autoreverses = true
            scaleX.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
            scaleX.duration = Double(arc4random()%4+3)
            
            bt.layer.addAnimation(scaleX, forKey: "scaleXAnimation")
            
            
            
            //2.Y方向上的缩放 scale in Y
            let scaleY = CAKeyframeAnimation(keyPath:"transform.scale.y")
            scaleY.values = [1.0, 1.1, 1.0]
            scaleY.keyTimes = [0.0, 0.5,1.0]
            scaleY.repeatCount = Float.infinity
            scaleY.autoreverses = true
            scaleX.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
            scaleY.duration = Double(arc4random()%4+2)
            
            bt.layer.addAnimation(scaleY, forKey: "scaleYAnimation")
            
        }
 
    }
    
    
    class func moveAnimation(btn:UIButton) {
        
        let pathAnimation = CAKeyframeAnimation(keyPath: "position")
        let path = UIBezierPath()
        path.moveToPoint(CGPointMake(77.5, 41.5))
        path.addCurveToPoint(CGPointMake(102.5, 55.5), controlPoint1: CGPointMake(86.42, 41.5), controlPoint2: CGPointMake(96.64, 55.45))
        path.addCurveToPoint(CGPointMake(124.5, 42.5), controlPoint1: CGPointMake(129.51, 55.74), controlPoint2: CGPointMake(124.5, 42.5))
        pathAnimation.path = path.CGPath
        pathAnimation.duration = 1.2
        btn.layer.addAnimation(pathAnimation, forKey: "runLine")
        
    }
    
    /**
     按钮点下动画
     */
    class func btnTouchDownAnimation(btn:UIButton){
        
        let animation = CABasicAnimation(keyPath: "transform.scale")
                animation.duration = 0.3;
        animation.repeatCount = 1;
        
        animation.fromValue = NSNumber(float: 1)
        animation.toValue = NSNumber(float: 1.5)
        animation.timingFunction = CAMediaTimingFunction(controlPoints: 0.23, 1.3, 0.7, 1.06)
        animation.removedOnCompletion = false;
        animation.fillMode = kCAFillModeForwards;
        
        btn.layer.addAnimation(animation, forKey: "scale-layer")
    }
    
    /**
     按钮松开动画
     */
    class func btnTouchUpAnimation(btn:UIButton){
        
        let animation = CABasicAnimation(keyPath: "transform.scale")
        animation.duration = 0.3;
        animation.repeatCount = 1;
        
        animation.fromValue = NSNumber(float: 1.5)
        animation.toValue = NSNumber(float: 1)
        
        animation.removedOnCompletion = false;
        animation.fillMode = kCAFillModeForwards;
        
        btn.layer.addAnimation(animation, forKey: "scale-layer")
    }
    
    
}