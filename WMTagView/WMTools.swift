//
//  WMTools.swift
//  WMTagView
//
//  Created by wumeng on 2019/7/19.
//  Copyright © 2019 wumeng. All rights reserved.
//

import UIKit


//MARK:- appScreen
let APP_SCRAL = UIScreen.main.bounds.size.width/375.0 //根据6的小屏幕为标准
let APP_SCRAL_WIDTH = UIScreen.main.bounds.size.width //屏幕的宽度
let APP_SCRAL_HEIGHT = UIScreen.main.bounds.size.height //屏幕的高度
//顶部
let SafeAreaTopHeight = (APP_SCRAL_HEIGHT==812.0&&APP_SCRAL_WIDTH==375.0  ? 88 : 64)
let SafeStatusBarHeight = (APP_SCRAL_HEIGHT==812.0&&APP_SCRAL_WIDTH==375.0 ? 44 : 20)
let SafeTabBarHeight = (APP_SCRAL_HEIGHT==812.0&&APP_SCRAL_WIDTH==375.0 ? 34 : 0)
//  系统版本号
let DeviceSystenVersion = Double(UIDevice.current.systemVersion) ?? 0.0
let iOS7 = (DeviceSystenVersion >= 7.0 && DeviceSystenVersion < 8.0)
let iOS8 = (DeviceSystenVersion >= 8.0 && DeviceSystenVersion < 9.0)
let iOS9 = (DeviceSystenVersion >= 9.0 && DeviceSystenVersion < 10.0)
let iOS10 = (DeviceSystenVersion >= 10.0 && DeviceSystenVersion < 11.0)
let iOS11 = (DeviceSystenVersion >= 11.0 && DeviceSystenVersion < 12.0)


//MARK:- callbacks
typealias CallBack_Normal = () -> Void
typealias CallBack_BtnClick = (_ sender:UIButton) -> Void
typealias CallBack_BtnClickInfo = (_ sender:UIButton,Any) -> Void
typealias CallBack_OneAny = (_ object:Any) -> Void


//获取状态栏的rect
let statusRect = UIApplication.shared.statusBarFrame;








extension UILabel {
    
    /// 快速构造新的label
    ///
    /// - Parameters:
    ///   - font: 大小
    ///   - textColor: 颜色
    /// - Returns: UIlabel对象
    class func createNewLable(font:UIFont,textColor:UIColor) -> UILabel {
        
        let label = UILabel.init();
        label.font = font;
        label.textColor = textColor;
        return label;
    }
    /// 快速构造新的label
    ///
    /// - Parameters:
    ///   - font: 大小
    ///   - textColor: 颜色
    /// - Returns: UIlabel对象
    class func createNewLable(font:UIFont,textColor:UIColor,text:String) -> UILabel {
        
        let label = UILabel.init();
        label.font = font;
        label.textColor = textColor;
        label.text = text;
        return label;
    }
    
}






class WMTools: NSObject {

}
