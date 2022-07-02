//
//  Macau_CovidApp.swift
//  Macau Covid
//
//  Created by miuGrey on 2022/7/1.
//

import SwiftUI
import BaiduMapAPI_Base


class AppDelegate: UIResponder, UIApplicationDelegate, BMKGeneralDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // 要使用百度地图，请先启动BMKMapManager
        let mapManager = BMKMapManager()
        // 启动引擎并设置AK并设置delegate
        if !(mapManager.start("rxOBcGxmGKdpGYhxM4Lslf42Esjr8RKs", generalDelegate: self)) {
            NSLog("启动引擎失败")
        }
        
        if BMKMapManager.setCoordinateTypeUsedInBaiduMapSDK(BMK_COORD_TYPE.COORDTYPE_BD09LL) {
            NSLog("经纬度类型设置成功")
        } else {
            NSLog("经纬度类型设置失败")
        }
        
        return true
    }
    
}


@main
struct Macau_CovidApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
