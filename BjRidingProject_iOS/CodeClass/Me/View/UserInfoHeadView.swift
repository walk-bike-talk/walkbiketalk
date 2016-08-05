//
//  UserInfoHeadView.swift
//  BjRidingProject_iOS
//
//  Created by 刘桂东 on 16/6/21.
//  Copyright © 2016年 gaoming. All rights reserved.
//

import Foundation

class UserInfoHeadView:UICollectionReusableView{
    
    let bgImg = UIImageView()
    let backBtn = UIButton()
    let headImg = UIImageView()
    let userNameT = UITextField()
    let contentT = UITextField()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubviews()
        self.addSubviewsLayout()
    }
    
    func addSubviews(){
        self.addSubview(bgImg)
        self.addSubview(backBtn)
        self.addSubview(headImg)
        self.addSubview(userNameT)
        self.addSubview(contentT)
        
        bgImg.backgroundColor = UIColor.lightGrayColor()
        
    }
    
    func addSubviewsLayout(){
        bgImg.snp_makeConstraints { (make) in
            make.top.equalTo(0)
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.height.equalTo(ToolClass.screenHeight()*0.3)
        }
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}