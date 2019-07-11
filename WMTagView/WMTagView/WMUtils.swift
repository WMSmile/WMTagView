//
//  WMUtils.swift
//  WMTagView
//
//  Created by wumeng on 2019/7/10.
//  Copyright © 2019 wumeng. All rights reserved.
//

import UIKit


//let DEVICE_WIDTH = UIScreen.main.bounds.size.width
//let DEVICE_HEIGHT =  UIScreen.main.bounds.size.height

class WMUtils: NSObject {
    
    //MARK:- <#Description#>
    class func WM_FUNC_getSizeByString(str:String,font:CGFloat,boundSize:CGSize) -> CGSize {
        if(str.isEmpty){
            return CGSize.init(width: 0, height: 0)
        }
        let options = NSStringDrawingOptions.usesFontLeading.union(.usesLineFragmentOrigin)
        let size = NSString(string: str).boundingRect(with: boundSize, options: options, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15)], context: nil).size
        return size;
    }
    
    

}
