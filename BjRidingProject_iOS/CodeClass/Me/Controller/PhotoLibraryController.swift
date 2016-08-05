//
//  PhotoLibraryController.swift
//  BjRidingProject_iOS
//
//  Created by 刘桂东 on 16/6/23.
//  Copyright © 2016年 gaoming. All rights reserved.
//

import Foundation

internal let ImageCellIdentifier = "ImageCell"

internal let defaultItemSpacing: CGFloat = 1

class PhotoLibraryController:UIViewController,UICollectionViewDelegate{
    
    override func viewDidLoad() {
        self.addSubviews()
    }
    
    func addSubviews(){
        setNeedsStatusBarAppearanceUpdate()
        
        let buttonImage = UIImage(named: "libraryCancel")
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: buttonImage, style: UIBarButtonItemStyle.Plain, target: self, action: #selector(dismiss))
        
        view.backgroundColor = UIColor(white: 0.2, alpha: 1)
        
        let flowLayout = UICollectionViewFlowLayout()
        let collectionV = UICollectionView(frame: CGRectMake(0, 0, 0, 0), collectionViewLayout: flowLayout)
        
        self.view.addSubview(collectionV)
        
    }
    
    func dismiss(){
        
    }
}