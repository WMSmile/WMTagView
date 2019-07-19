//
//  WMSelectedItemProtocol.swift
//  WMTagView
//
//  Created by wumeng on 2019/7/19.
//  Copyright © 2019 wumeng. All rights reserved.
//

import UIKit

//
@objc protocol WMSelectedItemProtocol {
    //显示title
    @objc optional func getTitle() -> String;
    //是否选择
    @objc optional func getIsSelected() -> Bool;
    
    @objc optional func updateIsSelected(_ isSelected:Bool) -> Void;
    
    
}
