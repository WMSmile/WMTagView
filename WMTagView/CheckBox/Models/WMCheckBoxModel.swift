//
//  WMCheckBoxModel.swift
//  WMTagView
//
//  Created by wumeng on 2019/7/19.
//  Copyright © 2019 wumeng. All rights reserved.
//

import UIKit



class WMCheckBoxModel: WMBaseItemModel ,WMSelectedItemProtocol{
    
    var isSelected:Bool = false
    
    //MARK:- SelectedItemProtocol
    func getTitle() -> String {
        return self.itemName ?? ""
    }
    func getIsSelected() -> Bool {
        return self.isSelected
    }
    func updateIsSelected(_ isSelected: Bool) {
        self.isSelected = isSelected;
    }
    
}
