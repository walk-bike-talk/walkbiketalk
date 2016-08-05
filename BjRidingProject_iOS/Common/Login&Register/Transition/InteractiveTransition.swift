//
//  InteractiveTransition.swift
//  BjRidingProject_iOS
//
//  Created by 刘桂东 on 16/6/16.
//  Copyright © 2016年 gaoming. All rights reserved.
//

import Foundation
import UIKit



enum InteractiveTransitionGestureDirection : NSInteger { //手势方向
    case InteractiveTransitionGestureDirectionLeft = 0
    case InteractiveTransitionGestureDirectionRight
    case InteractiveTransitionGestureDirectionUp
    case InteractiveTransitionGestureDirectionDown
}

enum InteractiveTransitionType : NSInteger { //手势控制哪种转场
    case InteractiveTransitionTypePresent = 0
    case InteractiveTransitionTypeDismiss
    case InteractiveTransitionTypePush
    case InteractiveTransitionTypePop
}

class InteractiveTransition : UIPercentDrivenInteractiveTransition{
    /**记录是否开始手势，判断pop操作是手势触发还是返回键触发*/
    var interation : Bool?
    /**促发手势present的时候的config，config中初始化并present需要弹出的控制器*/
    
}