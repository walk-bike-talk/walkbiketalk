//
//  Login.swift
//  BjRidingProject_iOS
//
//  Created by 刘桂东 on 16/6/16.
//  Copyright © 2016年 gaoming. All rights reserved.
//

import Foundation
import UIKit
import SnapKit
import Alamofire

var closeBtn_width:CGFloat = 25

class LoginController: UIViewController, UINavigationControllerDelegate, UITextFieldDelegate {
    
    let backBtn = UIButton()
    
    let phoneTextF = UITextField()
    let phoneImg = UIImageView()
    let phoneLine = UIView()
    let passwordTextF = UITextField()
    let passwordImg = UIImageView()
    let passwordLine = UIView()
    
    let loginBtn = UIButton()
    let registerBtn = UIButton()
    let forgetPwdBtn = UIButton()
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = ToolClass.color(R: 39, G: 43, B: 51, alpha: 1)
        
        
        self.addSubviews()
        self.addSubviewsLayout()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.delegate = self
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    
    func addSubviews(){
        
        self.view.addSubview(backBtn)
        self.view.addSubview(phoneImg)
        self.view.addSubview(phoneTextF)
        self.view.addSubview(phoneLine)
        self.view.addSubview(passwordImg)
        self.view.addSubview(passwordTextF)
        self.view.addSubview(passwordLine)
        self.view.addSubview(loginBtn)
        self.view.addSubview(registerBtn)
        self.view.addSubview(forgetPwdBtn)

        
        
        backBtn.setImage(UIImage(named: "icon_close"), forState: UIControlState.Normal)
        backBtn.addTarget(self, action: #selector(LoginController.clickBackBtn), forControlEvents: UIControlEvents.TouchUpInside)
        
        ToolClass.setTextFValue(imgName: "icon_phone", placeholder: "请输入您的手机号", img: phoneImg, textF: phoneTextF, line: phoneLine, isEntry: false)
        phoneTextF.delegate = self
        
        ToolClass.setTextFValue(imgName: "icon_pwd", placeholder: "请输入您的密码", img: passwordImg, textF: passwordTextF, line: passwordLine, isEntry: true)
        
        loginBtn.setTitle("登录", forState: UIControlState.Normal)
        loginBtn.setBackgroundImage(UIImage(named: "icon_login"), forState: UIControlState.Normal)
        loginBtn.addTarget(self, action: #selector(LoginController.clickLogin), forControlEvents: UIControlEvents.TouchUpInside)
        loginBtn.titleLabel?.font = ToolClass.setFontSize(16)
        loginBtn.titleEdgeInsets = EdgeInsetsMake(-6, left: 0, bottom: 0, right: 0)
        
        registerBtn.setTitle("注册账号", forState: UIControlState.Normal)
        registerBtn.setTitleColor(ToolClass.greenColor(), forState: UIControlState.Normal)
        registerBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignment.Left
        registerBtn.titleLabel?.font = ToolClass.setFontSize(14)
        registerBtn.addTarget(self, action: #selector(LoginController.clickRegisterBtn), forControlEvents: UIControlEvents.TouchUpInside)
        
        
        forgetPwdBtn.setTitle("忘记密码", forState: UIControlState.Normal)
        forgetPwdBtn.setTitleColor(ToolClass.greenColor(), forState: UIControlState.Normal)
        forgetPwdBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignment.Right
        forgetPwdBtn.titleLabel?.font = ToolClass.setFontSize(14)
        
    }
    
    
    
    func addSubviewsLayout(){
        backBtn.snp_makeConstraints { (make) in
            make.top.equalTo(30)
            make.right.equalTo(-20)
            make.size.equalTo(CGSizeMake(closeBtn_width*ToolClass.autoSizeScaleW(), closeBtn_width*ToolClass.autoSizeScaleW()))
        }
        
        phoneImg.snp_makeConstraints { (make) in
            make.top.equalTo(250*ToolClass.autoSizeScaleH())
            make.left.equalTo(60)
            make.size.equalTo(CGSizeMake(25, 25))
        }
        
        phoneTextF.snp_makeConstraints { (make) in
            make.top.equalTo(250*ToolClass.autoSizeScaleH())
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
        
        loginBtn.snp_makeConstraints { (make) in
            make.top.equalTo(passwordLine.snp_bottom).offset(44*ToolClass.autoSizeScaleH())
            make.left.equalTo(60)
            make.right.equalTo(-60)
            make.height.equalTo(50)
        }
        
        registerBtn.snp_makeConstraints { (make) in
            make.left.equalTo(20)
            make.bottom.equalTo(-20)
            make.size.equalTo(CGSizeMake(60, 20))
        }
        
        forgetPwdBtn.snp_makeConstraints { (make) in
            make.right.equalTo(-20)
            make.bottom.equalTo(-20)
            make.size.equalTo(CGSizeMake(80, 20))
        }
        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        super.touchesBegan(touches, withEvent: event)
        self.view.endEditing(true)
    }
    
    
    func clickLogin(){
        if !ToolClass.isTelNumber(phoneTextF.text!)
        {
            ToolClass.addHUD("手机号格式不正确!", view: self.view)
            return
        }else if passwordTextF.text?.characters.count==0{
            ToolClass.addHUD("请正确填写信息!", view: self.view)
            return
        }
        
        let parameters:NSDictionary = ["mobilePhone":self.phoneTextF.text!,"password":self.passwordTextF.text!]
        
        Alamofire.request(.GET, baseApi.stringByAppendingString(loginApi), parameters: parameters as? [String : AnyObject]).validate().responseJSON { (response) in
            switch response.result{
            case .Success:
                let dic:NSDictionary = response.result.value as! NSDictionary
                print(dic)
                if dic["code"] as! Int == 200{
                    let userInfo = UserInfoModel()
                    userInfo.setValuesForKeysWithDictionary(dic["data"] as! [String : AnyObject])
                    ToolClass.saveUserInfo(userInfo)
                    self.dismissViewControllerAnimated(true, completion: nil)
                }
                
                break
            case .Failure(let error):
                print(error)
                break
            }
        }
        
    }
    
    func clickBackBtn(){
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func clickRegisterBtn(){
        let registerVC = RegisterController()
        self.navigationController?.pushViewController(registerVC, animated: true)
    }
    
    func navigationController(navigationController: UINavigationController, animationControllerForOperation operation: UINavigationControllerOperation, fromViewController fromVC: UIViewController, toViewController toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        if operation == UINavigationControllerOperation.Push {
            return LoginTransitionPush()
        }
        else
        {
            return nil
        }
    }
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        let text:NSMutableString = textField.text!.mutableCopy() as! NSMutableString
        text.replaceCharactersInRange(range, withString: string)
        return text.length <= 11
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
}