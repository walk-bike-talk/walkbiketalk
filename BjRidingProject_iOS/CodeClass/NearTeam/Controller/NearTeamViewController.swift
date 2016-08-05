//
//  NearTeamViewController.swift
//  BjRidingProject_iOS
//
//  Created by 刘桂东 on 16/7/19.
//  Copyright © 2016年 gaoming. All rights reserved.
//

import UIKit

class NearTeamViewController: UIViewController,BMKLocationServiceDelegate,BMKMapViewDelegate {
    
    let locService = BMKLocationService()
    var mapView = BMKMapView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        self.locationService()
        mapView = BMKMapView(frame: self.view.frame)
        self.view.addSubview(mapView)
    }
    
    override func viewWillAppear(animated: Bool) {
        mapView.viewWillAppear()
        mapView.delegate = self  // 此处记得不用的时候需要置nil，否则影响内存的释放
    }
    
    override func viewWillDisappear(animated: Bool) {
        mapView.viewWillDisappear()
        mapView.delegate = nil  // 不用时，置nil
    }
    
    func locationService(){
        locService.delegate = self
        locService.startUserLocationService()
    }
    
    func didUpdateBMKUserLocation(userLocation: BMKUserLocation!) {
        print(userLocation.location.coordinate.latitude,userLocation.location.coordinate.longitude)
    }
    
    func didUpdateUserHeading(userLocation: BMKUserLocation!) {
        print("...")
        
    }
    
    func mapViewDidFinishLoading(mapView: BMKMapView!) {
        print("地图加载完毕！");
    }
}
