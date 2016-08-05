//
//  SetUserInfoController.swift
//  BjRidingProject_iOS
//
//  Created by 刘桂东 on 16/6/21.
//  Copyright © 2016年 gaoming. All rights reserved.
//

import Foundation

class SetUserInfoController:UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    var collectionV:UICollectionView?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.automaticallyAdjustsScrollViewInsets = false
        self.addSubviews()
        self.addSubviewLayout()
    }
    
    func addSubviews(){
        let layout = UICollectionViewFlowLayout()
        
        let collectionV = UICollectionView(frame: CGRectMake(0, 0, 0, 0), collectionViewLayout: layout)
        collectionV.backgroundColor = UIColor.whiteColor()
        layout.itemSize = CGSizeMake(100, 100)
        collectionV.delegate = self
        collectionV.dataSource = self
        self.view.addSubview(collectionV)
        
        collectionV.registerClass(UICollectionViewCell.classForCoder(), forCellWithReuseIdentifier: "cell")
        collectionV.registerClass(UserInfoHeadView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "head")
        
        self.collectionV = collectionV
        
    }
    
    func addSubviewLayout(){
        collectionV!.snp_makeConstraints { (make) in
            make.top.equalTo(0)
            make.bottom.equalTo(0)
            make.right.equalTo(0)
            make.left.equalTo(0)
        }
    }
    

    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        return 10
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell{
        let cell:UICollectionViewCell = collectionV!.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath)
        cell.backgroundColor = ToolClass.greenColor()
        return cell
    }
    
    
    
    func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView{
        
        var headV = UserInfoHeadView()
        
        if kind == UICollectionElementKindSectionHeader {
            
            headV = collectionView.dequeueReusableSupplementaryViewOfKind(kind, withReuseIdentifier: "head", forIndexPath: indexPath) as! UserInfoHeadView
            headV.backgroundColor = UIColor.redColor()
        }
        
        
        return headV
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize
    {
        return CGSizeMake(ToolClass.screenWidth(), ToolClass.screenHeight()*0.3+120)
    }
}