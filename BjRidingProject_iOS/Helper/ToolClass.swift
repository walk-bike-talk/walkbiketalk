//
//  ToolClass.swift
//  BjRidingProject_iOS
//
//  Created by 刘桂东 on 16/6/15.
//  Copyright © 2016年 gaoming. All rights reserved.
//

import Foundation
import UIKit
import MBProgressHUD

public class ToolClass {
    
    
    
    class func saveUserInfo(object:AnyObject){
        
        NSUserDefaults.standardUserDefaults().setObject(NSKeyedArchiver.archivedDataWithRootObject(object), forKey: "userInfo")
        
    }
    
    
    class func getUserInfo()->UserInfoModel? {
        
        let data = NSUserDefaults.standardUserDefaults().objectForKey("userInfo") as? NSData
        guard (data != nil) else{return nil}
        
        return NSKeyedUnarchiver.unarchiveObjectWithData(data!) as? UserInfoModel
    }
    
    
    
    
    /**
     设置字体大小
     
     - parameter size: 字号大小
     
     - returns: UIFont对象
     */
    class func setFontSize(size:CGFloat)->UIFont{
        
        let font = UIFont(name: "FZLanTingHei-EL-GBK", size: size*self.autoSizeScaleW())
        
        return font!
    }
    
    
    /**
     返回屏幕的宽
     */
    class func screenWidth()->CGFloat{
        return UIScreen.mainScreen().bounds.width
    }
    
    /**
     返回屏幕的高
     */
    class func screenHeight()->CGFloat{
        return UIScreen.mainScreen().bounds.height
    }
    
    /**
     宽百分比
     */
    class func autoSizeScaleW()->CGFloat{
        return UIScreen.mainScreen().bounds.width/414
    }
    
    /**
     高百分比
     */
    class func autoSizeScaleH()->CGFloat{
        return UIScreen.mainScreen().bounds.height/716
    }
    
    /**
     RGB颜色
     */
    class func color(R R:CGFloat,G:CGFloat,B:CGFloat,alpha:CGFloat)->UIColor{
        return UIColor(red: R/255.0, green: G/255.0, blue: B/255.0, alpha: alpha)
    }
    
    class func greenColor()->UIColor {
        return self.color(R: 43, G: 140, B: 79, alpha: 1)
    }
    
    
    /**
     注册登录输入框
     */
    class func setTextFValue(imgName imgName:String, placeholder:String, img:UIImageView, textF:UITextField, line:UIView, isEntry:Bool){
        
        img.image = UIImage(named: imgName)
        textF.placeholder = placeholder
        textF.setValue(ToolClass.color(R: 43, G: 140, B: 79, alpha: 0.4), forKeyPath: "_placeholderLabel.textColor")
        textF.tintColor = ToolClass.greenColor()
        textF.setValue(ToolClass.setFontSize(14), forKeyPath: "_placeholderLabel.font")
        textF.textColor = ToolClass.greenColor()
        textF.secureTextEntry = isEntry
        line.backgroundColor = ToolClass.greenColor()
    }
    
    class func createImageWithColor(color:UIColor)->UIImage
    {
        let rect:CGRect = CGRectMake(0, 0, 1, 1)
        UIGraphicsBeginImageContext(rect.size)
        let context:CGContextRef = UIGraphicsGetCurrentContext()!
        CGContextSetFillColorWithColor(context, color.CGColor)
        CGContextFillRect(context, rect);
        let theImage:UIImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        return theImage;
    }
    
    
    /**
     验证手机号
     */
    class func isTelNumber(num:NSString)->Bool
    {
        let mobile = "^1(3[0-9]|5[0-35-9]|8[025-9])\\d{8}$"
        let  CM = "^1(34[0-8]|(3[5-9]|5[017-9]|8[278])\\d)\\d{7}$"
        let  CU = "^1(3[0-2]|5[256]|8[56])\\d{8}$"
        let  CT = "^1((33|53|8[09])[0-9]|349)\\d{7}$"
        let regextestmobile = NSPredicate(format: "SELF MATCHES %@",mobile)
        let regextestcm = NSPredicate(format: "SELF MATCHES %@",CM )
        let regextestcu = NSPredicate(format: "SELF MATCHES %@" ,CU)
        let regextestct = NSPredicate(format: "SELF MATCHES %@" ,CT)
        if ((regextestmobile.evaluateWithObject(num) == true)
            || (regextestcm.evaluateWithObject(num)  == true)
            || (regextestct.evaluateWithObject(num) == true)
            || (regextestcu.evaluateWithObject(num) == true))
        {
            return true
        }
        else
        {
            return false
        }
    }
    
    
    class func addHUD(str:String,view:UIView){
        let hud = MBProgressHUD.showHUDAddedTo(view, animated: true)
        hud.mode = MBProgressHUDMode.Text
        hud.labelFont = ToolClass.setFontSize(14)
        hud.color = ToolClass.greenColor()
        hud.labelText = str
        hud.margin = 10
        hud.yOffset = -60
        hud.removeFromSuperViewOnHide = true
        hud.hide(true, afterDelay: 2)
    }
}