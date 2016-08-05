//
//  UserInfoModel.swift
//  BjRidingProject_iOS
//
//  Created by 汪高明 on 16/6/17.
//  Copyright © 2016年 gaoming. All rights reserved.
//

import Foundation

class UserInfoModel : NSObject,NSCoding{
    
    var userInfoModel : UserInfoModel?
    var password:String!
    var age:String!
    var Models:String!
    var ftime:String!
    var gender:String!
    var height:String!
    var user_id:String!
    var user_name:String!
    var user_phone:String!
    var weight:String!
    var headImg:String!

    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(password, forKey: "password")
        aCoder.encodeObject(age, forKey: "age")
        aCoder.encodeObject(Models, forKey: "Models")
        aCoder.encodeObject(ftime, forKey: "ftime")
        aCoder.encodeObject(gender, forKey: "gender")
        aCoder.encodeObject(height, forKey: "height")
        aCoder.encodeObject(user_id, forKey: "user_id")
        aCoder.encodeObject(user_name, forKey: "user_name")
        aCoder.encodeObject(user_phone, forKey: "user_phone")
        aCoder.encodeObject(weight, forKey: "weight")
        aCoder.encodeObject(headImg, forKey: "headImg")
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init()
        self.password = aDecoder.decodeObjectForKey("password") as! String
        self.age = aDecoder.decodeObjectForKey("age") as! String
        self.Models = aDecoder.decodeObjectForKey("Models") as! String
        self.ftime = aDecoder.decodeObjectForKey("ftime") as! String
        self.gender = aDecoder.decodeObjectForKey("gender") as! String
        self.height = aDecoder.decodeObjectForKey("height") as! String
        self.user_id = aDecoder.decodeObjectForKey("user_id") as! String
        self.user_name = aDecoder.decodeObjectForKey("user_name") as! String
        self.user_phone = aDecoder.decodeObjectForKey("user_phone") as! String
        self.weight = aDecoder.decodeObjectForKey("weight") as! String
        self.headImg = aDecoder.decodeObjectForKey("headImg") as! String
    }
    
    override init() {
        
    }
    
}