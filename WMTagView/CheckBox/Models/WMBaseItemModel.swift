//
//  WMBaseItemModel.swift
//  WMTagView
//
//  Created by wumeng on 2019/7/19.
//  Copyright © 2019 wumeng. All rights reserved.
//

import UIKit

class WMBaseItemModel: NSObject {
    var itemId : String! = ""
    var itemName : String! = ""
    
    
    var extraData: String! = ""
    var extraData1: String! = ""
    var extraData2: String! = ""
    
    
    
    convenience init(_ id: String, _ name: String) {
        self.init()
        itemId = id
        itemName = name
    }
    
    
}

