//
//  registerController.swift
//  BjRidingProject_iOS
//
//  Created by 刘桂东 on 16/6/17.
//  Copyright © 2016年 gaoming. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import NVActivityIndicatorView
import SVProgressHUD
import MBProgressHUD

class RegisterController : UIViewController, UINavigationControllerDelegate,UITextFieldDelegate{
    
    let backBtn = UIButton()
    
    let phoneTextF = UITextField()
    let phoneImg = UIImageView()
    let phoneLine = UIView()
    
    let passwordTextF = UITextField()
    let passwordImg = UIImageView()
    let passwordLine = UIView()
    
    let userNameTextF = UITextField()
    let userNameImg = UIImageView()
    let userNameLine = UIView()
    
    let codeTextF = UITextField()
    let codeImg = UIImageView()
    let codeLine = UIView()
    
    let sendBtn = UIButton()
    
    let registerBtn = UIButton()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = ToolClass.color(R: 39, G: 43, B: 51, alpha: 1)
        self.navigationController?.delegate = self
        
        self.addSubviews()
        self.addSubviewLayout()
        
    }
    
    
    func netRequest(){
        if !ToolClass.isTelNumber(phoneTextF.text!)
        {
            ToolClass.addHUD("手机号格式不正确!", view: self.view)
            return
        }else if passwordTextF.text?.characters.count<6{
            ToolClass.addHUD("密码长度不足6位!", view: self.view)
            return
        }else if userNameTextF.text?.characters.count==0{
            ToolClass.addHUD("昵称不能为空", view: self.view)
            return
        }
        
        SMSSDK.commitVerificationCode(codeTextF.text, phoneNumber: phoneTextF.text, zone: "86") { (let error) in
            if (error == nil){
                let parameters:NSDictionary = ["mobilePhone":self.phoneTextF.text!,"password":self.passwordTextF.text!,"userName":self.userNameTextF.text!]
                
                Alamofire.request(.GET, baseApi.stringByAppendingString(registerApi), parameters: parameters as? [String : AnyObject]).validate().responseJSON { (response) in
                    switch response.result{
                    case .Success:
                        if response.result.value?.code == 200{
                            self.navigationController?.popViewControllerAnimated(true)
                        }
                        
                        break
                    case .Failure(let error):
                        print(error)
                        break
                    }
                }
            }
            else
            {
                ToolClass.addHUD("验证码错误！", view: self.view)
            }
        }
    }
    
    
    func clickSendBtn(){
        
        SMSSDK.getVerificationCodeByMethod(SMSGetCodeMethodSMS, phoneNumber: "13339912193", zone: "86", customIdentifier: nil) { (error) in
            if (error == nil){
                print("获取验证码成功")
                RegisterAnimation.sendBtnWithAnimation(self.sendBtn,view: self.view)
            }
            else
            {
                ToolClass.addHUD("获取验证码失败!", view: self.view)
            }
        }
        
    }
    
    
    
    
    
    
    
    func addSubviews(){
        self.view.addSubview(backBtn)
        self.view.addSubview(phoneImg)
        self.view.addSubview(phoneTextF)
        self.view.addSubview(phoneLine)
        self.view.addSubview(passwordImg)
        self.view.addSubview(passwordTextF)
        self.view.addSubview(passwordLine)
        self.view.addSubview(userNameImg)
        self.view.addSubview(userNameTextF)
        self.view.addSubview(userNameLine)
        self.view.addSubview(codeImg)
        self.view.addSubview(codeTextF)
        self.view.addSubview(codeLine)
        self.view.addSubview(sendBtn)
        self.view.addSubview(registerBtn)
        
        
        backBtn.setImage(UIImage(named: "icon_back"), forState: UIControlState.Normal)
        backBtn.addTarget(self, action: #selector(RegisterController.clickBack), forControlEvents: UIControlEvents.TouchUpInside)
        
        
        ToolClass.setTextFValue(imgName: "icon_phone", placeholder: "请输入您的手机号", img: phoneImg, textF: phoneTextF, line: phoneLine,isEntry: false)
        phoneTextF.delegate = self
        
        ToolClass.setTextFValue(imgName: "icon_pwd", placeholder: "请输入您的密码", img: passwordImg, textF: passwordTextF, line: passwordLine,isEntry: true)
        
        ToolClass.setTextFValue(imgName: "icon_userName", placeholder: "请输入您的昵称", img: userNameImg, textF: userNameTextF, line: userNameLine,isEntry: false)
        
        ToolClass.setTextFValue(imgName: "icon_code", placeholder: "请输入验证码", img: codeImg, textF: codeTextF, line: codeLine,isEntry: false)
        
        sendBtn.setBackgroundImage(ToolClass.createImageWithColor(ToolClass.greenColor()), forState: UIControlState.Normal)
        sendBtn.addTarget(self, action: #selector(RegisterController.clickSendBtn), forControlEvents: UIControlEvents.TouchUpInside)
        sendBtn.setTitle("发送", forState: UIControlState.Normal)
        sendBtn.titleLabel?.font = ToolClass.setFontSize(12)
        
        registerBtn.setTitle("注册", forState: UIControlState.Normal)
        registerBtn.setBackgroundImage(UIImage(named: "icon_login"), forState: UIControlState.Normal)
        registerBtn.titleLabel?.font = ToolClass.setFontSize(16)
        registerBtn.titleEdgeInsets = UIEdgeInsetsMake(-6, 0, 0, 0)
        registerBtn.addTarget(self, action: #selector(RegisterController.netRequest), forControlEvents: UIControlEvents.TouchUpInside)
        
    }

    func addSubviewLayout(){
        backBtn.snp_makeConstraints { (make) in
            make.top.equalTo(30)
            make.left.equalTo(20)
            make.size.equalTo(CGSizeMake(closeBtn_width*ToolClass.autoSizeScaleW(), closeBtn_width*ToolClass.autoSizeScaleW()))
        }
        
        phoneImg.snp_makeConstraints { (make) in
            make.top.equalTo(140*ToolClass.autoSizeScaleH())
            make.left.equalTo(60)
            make.size.equalTo(CGSizeMake(25, 25))
        }
        
        phoneTextF.snp_makeConstraints { (make) in
            make.top.equalTo(140*ToolClass.autoSizeScaleH())
            make.left.equalTo(phoneImg.snp_right).offset(2)
            make.height.equalTo(25)
            make.right.equalTo(-60)
        }
        
        phoneLine.snp_makeConstraints { (make) in
            make.top.equalTo(phoneImg.snp_bottom).offset(4)
            make.left.equalTo(60)
            make.right.equalTo(-60)
            make.height.equalTo(0.5)
        }
        
        passwordImg.snp_makeConstraints { (make) in
            make.top.equalTo(phoneLine.snp_bottom).offset(44*ToolClass.autoSizeScaleH())
            make.left.equalTo(60)
            make.size.equalTo(CGSizeMake(25, 25))
        }
        
        passwordTextF.snp_makeConstraints { (make) in
            make.top.equalTo(phoneLine.snp_bottom).offset(44*ToolClass.autoSizeScaleH())
            make.left.equalTo(phoneImg.snp_right).offset(2)
            make.height.equalTo(25)
            make.right.equalTo(-60)
        }
        
        passwordLine.snp_makeConstraints { (make) in
            make.top.equalTo(passwordImg.snp_bottom).offset(4)
            make.left.equalTo(60)
            make.right.equalTo(-60)
            make.height.equalTo(0.5)
        }
        
        userNameImg.snp_makeConstraints { (make) in
            make.top.equalTo(passwordLine.snp_bottom).offset(44*ToolClass.autoSizeScaleH())
            make.left.equalTo(60)
            make.size.equalTo(CGSizeMake(25, 25))
        }
        
        userNameTextF.snp_makeConstraints { (make) in
            make.top.equalTo(passwordLine.snp_bottom).offset(44*ToolClass.autoSizeScaleH())
            make.left.equalTo(phoneImg.snp_right).offset(2)
            make.height.equalTo(25)
            make.right.equalTo(-60)
        }
        
        userNameLine.snp_makeConstraints { (make) in
            make.top.equalTo(userNameImg.snp_bottom).offset(4)
            make.left.equalTo(60)
            make.right.equalTo(-60)
            make.height.equalTo(0.5)
        }
        
        codeImg.snp_makeConstraints { (make) in
            make.top.equalTo(userNameLine.snp_bottom).offset(44*ToolClass.autoSizeScaleH())
            make.left.equalTo(60)
            make.size.equalTo(CGSizeMake(25, 25))
        }
        
        codeTextF.snp_makeConstraints { (make) in
            make.top.equalTo(userNameLine.snp_bottom).offset(44*ToolClass.autoSizeScaleH())
            make.left.equalTo(phoneImg.snp_right).offset(2)
            make.height.equalTo(25)
            make.right.equalTo(-120)
        }
        
        codeLine.snp_makeConstraints { (make) in
            make.top.equalTo(codeImg.snp_bottom).offset(4)
            make.left.equalTo(60)
            make.right.equalTo(-120)
            make.height.equalTo(0.5)
        }
        
        sendBtn.snp_makeConstraints { (make) in
            make.top.equalTo(userNameLine.snp_bottom).offset(44*ToolClass.autoSizeScaleH())
            make.left.equalTo(codeTextF.snp_right).offset(5)
            make.right.equalTo(-60)
            make.size.equalTo(CGSizeMake(55, 30))
        }
        
        
        
        registerBtn.snp_makeConstraints { (make) in
            make.top.equalTo(codeLine.snp_bottom).offset(44)
            make.left.equalTo(60)
            make.right.equalTo(-60)
            make.height.equalTo(50)
        }
        
    }
    
    func navigationController(navigationController: UINavigationController, animationControllerForOperation operation: UINavigationControllerOperation, fromViewController fromVC: UIViewController, toViewController toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        if operation == UINavigationControllerOperation.Pop {
            return LoginTransitionPop()
        }
        else
        {
            return nil
        }
    }
    
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        super.touchesBegan(touches, withEvent: event)
        self.view.endEditing(true)
    }
    
    func clickBack(){
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        let text:NSMutableString = textField.text!.mutableCopy() as! NSMutableString
        text.replaceCharactersInRange(range, withString: string)
        return text.length <= 11
    }
    
}