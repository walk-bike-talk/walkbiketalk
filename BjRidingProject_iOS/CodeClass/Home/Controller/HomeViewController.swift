//
//  ViewController.swift
//  BjRidingProject_iOS
//
//  Created by 刘桂东 on 16/6/15.
//  Copyright © 2016年 gaoming. All rights reserved.
//

import UIKit
import SnapKit
import ALCameraViewController
import Alamofire


var isFlag:Bool = true; //判断是否第一次进入

class HomeViewController: UIViewController ,UIViewControllerTransitioningDelegate{
    
    let topView = UIView()
    let bottomView = UIView()
    let headerImg = UIButton()
    let headerBottomV = UIView()
    let sexImg = UIImageView()
    let nameL = UILabel()
    let contentL = UILabel()
    let notiBtn = UIButton()
    let ridingBtn = UIButton() //骑行
    let motionRecordsBtn = UIButton() //运动记录
    let contactBtn = UIButton() //社交
    let equipBtn = UIButton() //装备
    let nearbyPeople = UIButton()//附近的人
    let nearbyTeam = UIButton() //附近的队伍
    let setBtn = UIButton() //设置
    let moreBtn = UIButton() //更多
    
    var headerImgWidth:CGFloat = 60  //头像宽度
    var headerBottomVWidth:CGFloat = 66  //头像宽度
    var sexImgWidth:CGFloat = 20 //性别宽度
    var notImgWidth:CGFloat = 25 //通知图标宽度
    
    var userInfo:UserInfoModel? = ToolClass.getUserInfo()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        
        self.addSubviews()
        self.addSubviewsLayout()
        self.netReuquest()
    }
    
    
    
    /**
     添加子控件
     */
    func addSubviews(){
        self.view.addSubview(topView)
        self.view.addSubview(bottomView)
        
        self.topView.addSubview(headerBottomV)
        self.topView.addSubview(headerImg)
        self.topView.addSubview(sexImg)
        self.topView.addSubview(nameL)
        self.topView.addSubview(contentL)
        self.topView.addSubview(notiBtn)
        
        self.bottomView.addSubview(ridingBtn)
        self.bottomView.addSubview(motionRecordsBtn)
        self.bottomView.addSubview(contactBtn)
        self.bottomView.addSubview(equipBtn)
        self.bottomView.addSubview(nearbyTeam)
        self.bottomView.addSubview(nearbyPeople)
        self.bottomView.addSubview(setBtn)
        self.bottomView.addSubview(moreBtn)
        
        
        topView.backgroundColor = ToolClass.color(R: 26, G: 29, B: 35, alpha: 0.73)
        bottomView.backgroundColor = ToolClass.color(R: 39, G: 43, B: 51, alpha: 1)
        
        notiBtn.setImage(UIImage(named: "icon_not"), forState: UIControlState.Normal)
        
        headerImg.layer.cornerRadius = headerImgWidth/2*ToolClass.autoSizeScaleW()
        headerImg.alpha = 0
       
        headerImg.layer.masksToBounds = true
        headerImg.setBackgroundImage(UIImage(named: "header_img"), forState: UIControlState.Normal)
        headerImg.addTarget(self, action: #selector(HomeViewController.clickHead), forControlEvents: UIControlEvents.TouchUpInside)
        
        headerBottomV.backgroundColor = ToolClass.color(R: 20, G: 23, B: 28, alpha: 0.4)
        headerBottomV.layer.cornerRadius = headerBottomVWidth/2*ToolClass.autoSizeScaleW()

        
        nameL.font = ToolClass.setFontSize(14)
        nameL.transform = CGAffineTransformMakeTranslation(0, 40)
        nameL.alpha = 0
        nameL.textColor = UIColor.whiteColor()
        nameL.text = "riding!"
        nameL.textAlignment = NSTextAlignment.Center
        
        contentL.font = ToolClass.setFontSize(14)
        contentL.transform = CGAffineTransformMakeTranslation(0, 40)
        contentL.alpha = 0
        contentL.textColor = UIColor.whiteColor()
        contentL.text = "一句话介绍一下自己吧，让别人更了解你!"
        contentL.textAlignment = NSTextAlignment.Center
        
        sexImg.image = UIImage(named: "icon_man")
        sexImg.alpha = 0
        
        
        self.setBtnWithValue("骑行", alpha: 0, radius: 26*ToolClass.autoSizeScaleW(), font: ToolClass.setFontSize(12*ToolClass.autoSizeScaleW()), btn: ridingBtn,imgName: "icon_riding")
        
        self.setBtnWithValue("运动记录", alpha: 0, radius: 32*ToolClass.autoSizeScaleW(), font: ToolClass.setFontSize(10*ToolClass.autoSizeScaleW()), btn: motionRecordsBtn,imgName: "icon_motionRecords")
        
        self.setBtnWithValue("社交", alpha: 0, radius: 29*ToolClass.autoSizeScaleW(), font: ToolClass.setFontSize(12*ToolClass.autoSizeScaleW()), btn: contactBtn,imgName: "icon_contact")
        
        self.setBtnWithValue("装备", alpha: 0, radius: 29*ToolClass.autoSizeScaleW(), font: ToolClass.setFontSize(12*ToolClass.autoSizeScaleW()), btn: equipBtn,imgName: "icon_equip")
        
        self.setBtnWithValue("附近的队伍", alpha: 0, radius: 40*ToolClass.autoSizeScaleW(), font: ToolClass.setFontSize(10*ToolClass.autoSizeScaleW()), btn: nearbyTeam,imgName: "icon_nearbyTeam")
        
        self.setBtnWithValue("附近的人", alpha: 0, radius: 33*ToolClass.autoSizeScaleW(), font: ToolClass.setFontSize(12*ToolClass.autoSizeScaleW()), btn: nearbyPeople,imgName: "icon_nearbyPeople")
        
        self.setBtnWithValue("设置", alpha: 0, radius: 26*ToolClass.autoSizeScaleW(), font: ToolClass.setFontSize(12*ToolClass.autoSizeScaleW()), btn: setBtn,imgName: "icon_set")
        
    }
    
    /**
     设置按钮属性值
     */
    func setBtnWithValue(title:String,alpha:CGFloat,radius:CGFloat,font:UIFont,btn:UIButton,imgName:String){
        btn.alpha = alpha
        btn.layer.cornerRadius = radius
        btn.setBackgroundImage(UIImage(named: imgName), forState: UIControlState.Normal)
        btn.setTitle(title, forState: UIControlState.Normal)
        btn.titleLabel?.font = font
        btn.addTarget(self, action: #selector(HomeViewController.touchDownBtn(_:)), forControlEvents: UIControlEvents.TouchDown)
        btn.addTarget(self, action: #selector(HomeViewController.touchUpBtn(_:)), forControlEvents: UIControlEvents.TouchUpInside)
    }
    
    
    /**
     子视图布局
     */
    func addSubviewsLayout(){
        
        
        topView.snp_makeConstraints { (make) in
            make.top.equalTo(0)
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.height.equalTo(ToolClass.screenHeight()*0.3)
        }
        
        bottomView.snp_makeConstraints { (make) in
            make.top.equalTo(ToolClass.screenHeight()*0.3)
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.height.equalTo(ToolClass.screenHeight()*0.7)
        }
        
        notiBtn.snp_makeConstraints { (make) in
            make.right.equalTo(-20)
            make.top.equalTo(30)
            make.size.equalTo(CGSizeMake(notImgWidth*ToolClass.autoSizeScaleW(), notImgWidth*ToolClass.autoSizeScaleW()))
        }
        
        
        headerImg.snp_makeConstraints { (make) in
            make.top.equalTo(64)
            make.centerX.equalToSuperview()
            make.size.equalTo(CGSizeMake(headerImgWidth*ToolClass.autoSizeScaleW(), headerImgWidth*ToolClass.autoSizeScaleW()))
        }
        
        headerBottomV.snp_makeConstraints { (make) in
            make.top.equalTo(61)
            make.centerX.equalToSuperview()
            make.size.equalTo(CGSizeMake(headerBottomVWidth*ToolClass.autoSizeScaleW(), headerBottomVWidth*ToolClass.autoSizeScaleW()))
        }
        
        sexImg.snp_makeConstraints { (make) in
            make.top.equalTo(headerImg.snp_bottom).offset(5)
            make.centerX.equalToSuperview()
            make.size.equalTo(CGSizeMake(sexImgWidth*ToolClass.autoSizeScaleW(), sexImgWidth*ToolClass.autoSizeScaleW()))
            
        }
        
        nameL.snp_makeConstraints { (make) in
            make.top.equalTo(sexImg.snp_bottom).offset(10)
            make.left.equalTo(10)
            make.right.equalTo(-10)
            make.height.equalTo(20)
        }
        
        contentL.snp_makeConstraints { (make) in
            make.top.equalTo(nameL.snp_bottom).offset(5)
            make.left.equalTo(10)
            make.right.equalTo(-10)
            make.height.equalTo(20)
        }
        
        
        ridingBtn.snp_makeConstraints { (make) in
            make.top.equalTo(topView.snp_bottom).offset(80*ToolClass.autoSizeScaleH())
            make.size.equalTo(CGSizeMake(52*ToolClass.autoSizeScaleW(), 52*ToolClass.autoSizeScaleW()))
            make.centerX.equalToSuperview().offset(-30*ToolClass.autoSizeScaleW())
        }
        
        
        motionRecordsBtn.snp_makeConstraints { (make) in
            make.top.equalTo(topView.snp_bottom).offset(110*ToolClass.autoSizeScaleH())
            make.size.equalTo(CGSizeMake(64*ToolClass.autoSizeScaleW(), 64*ToolClass.autoSizeScaleW()))
            make.right.equalTo(-90*ToolClass.autoSizeScaleW())
        }
        
        contactBtn.snp_makeConstraints { (make) in
            make.top.equalTo(topView.snp_bottom).offset(150*ToolClass.autoSizeScaleH())
            make.size.equalTo(CGSizeMake(58*ToolClass.autoSizeScaleW(), 58*ToolClass.autoSizeScaleW()))
            make.left.equalTo(100*ToolClass.autoSizeScaleW())
        }
        
        equipBtn.snp_makeConstraints { (make) in
            make.top.equalTo(topView.snp_bottom).offset(170*ToolClass.autoSizeScaleH())
            make.size.equalTo(CGSizeMake(58*ToolClass.autoSizeScaleW(), 58*ToolClass.autoSizeScaleW()))
            make.centerX.equalToSuperview().offset(10*ToolClass.autoSizeScaleW())
        }
        
        nearbyTeam.snp_makeConstraints { (make) in
            make.top.equalTo(contactBtn.snp_bottom).offset(40*ToolClass.autoSizeScaleH())
            make.size.equalTo(CGSizeMake(80*ToolClass.autoSizeScaleW(), 80*ToolClass.autoSizeScaleW()))
            make.centerX.equalToSuperview().offset(-60*ToolClass.autoSizeScaleW())
        }
        
        nearbyPeople.snp_makeConstraints { (make) in
            make.top.equalTo(contactBtn.snp_bottom).offset(30*ToolClass.autoSizeScaleH())
            make.size.equalTo(CGSizeMake(66*ToolClass.autoSizeScaleW(), 66*ToolClass.autoSizeScaleW()))
            make.centerX.equalToSuperview().offset(60*ToolClass.autoSizeScaleW())
        }
        
        setBtn.snp_makeConstraints { (make) in
            make.top.equalTo(nearbyPeople.snp_bottom).offset(20*ToolClass.autoSizeScaleH())
            make.size.equalTo(CGSizeMake(52*ToolClass.autoSizeScaleW(), 52*ToolClass.autoSizeScaleW()))
            make.centerX.equalToSuperview().offset(-5*ToolClass.autoSizeScaleW())
        }
        
    }
    
    
    
    /**
     网络请求
     */
    func netReuquest(){
        
    }
    
    
    func touchDownBtn(btn:UIButton){
        if btn == ridingBtn {
        }else if btn == motionRecordsBtn
        {
        }else if btn == contactBtn
        {
        }else if btn == equipBtn
        {
        }else if btn == nearbyTeam
        {
        }else if btn == nearbyPeople
        {
        }else if btn == setBtn
        {
        }
        HomeAnimationUtil.btnTouchDownAnimation(btn)
        
    }
    
    func touchUpBtn(btn:UIButton){
        HomeAnimationUtil.btnTouchUpAnimation(btn)
        if userInfo == nil {
            self.toLogin()
        }
        else
        {
            if btn == ridingBtn {
            }else if btn == motionRecordsBtn
            {
            }else if btn == contactBtn
            {
            }else if btn == equipBtn
            {
            }else if btn == nearbyTeam
            {
                let vc = NearTeamViewController()
                self.navigationController?.pushViewController(vc, animated: true)
                return
            }else if btn == nearbyPeople
            {
                
            }else if btn == setBtn
            {
            }
        }
        
    }
    
    
    /**
     去登录
     */
    func toLogin(){
        let loginVC : UIViewController = LoginController()
        let navVC = UINavigationController(rootViewController: loginVC)
        navVC.transitioningDelegate = self
        self.presentViewController(navVC, animated: true, completion: nil)
    }
    
    
    func clickHead(){
//        let croppingEnabled = true
//        let cameraViewController = CameraViewController(croppingEnabled: croppingEnabled) { image ,asset in
//            let img = image
//            self.headerImg.setBackgroundImage(img, forState: UIControlState.Normal)
//            self.dismissViewControllerAnimated(true, completion: nil)
//            
//            Alamofire.upload(.POST, baseApi.stringByAppendingString(upHeaderImgApi).stringByAppendingString("?user_id=61"), multipartFormData: { MultipartFormData in
//                MultipartFormData.appendBodyPart(data: UIImageJPEGRepresentation(img!, 0.1)!, name: "headimg", fileName: "portrait.jpeg", mimeType: "image/jpeg")
//                }, encodingCompletion: { encodingResult in
//                                        
//                    switch encodingResult {
//                    case .Success(let upload, _, _):
//                        upload.responseJSON { response in
//                           print(NSString.init(data: response.data!, encoding: NSUTF8StringEncoding))
//                            debugPrint(response)
//                        }
//                    case .Failure(let encodingError):
//                        print(encodingError)
//                    }
//            })
//        }
//        
//        presentViewController(cameraViewController, animated: true, completion: nil)
//        let userInfoVC = SetUserInfoController()
//        self.navigationController?.pushViewController(userInfoVC, animated: true)
        
        let photoLibVC = PhotoLibraryController()
        self.navigationController?.pushViewController(photoLibVC, animated: true)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        userInfo = ToolClass.getUserInfo()
        if userInfo != nil {
            
        }
    }
    
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        if isFlag == true
        {
            HomeAnimationUtil.headerImgAnimationWithImage(headerImg,nameL: nameL,contentL: contentL,notiBtn: notiBtn,sexImg: sexImg)
            HomeAnimationUtil.btnAnimation([ridingBtn,motionRecordsBtn,contactBtn,equipBtn,nearbyPeople,nearbyTeam,setBtn])
            isFlag = false
        }
        
    }
    
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return HomeTransitionLogin()
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return DismissTransitionLogin()
    }
}

