//
//  WMDeleteListenTextField.swift
//  WMTagView
//
//  Created by wumeng on 2019/7/11.
//  Copyright © 2019 wumeng. All rights reserved.
//

import UIKit



class WMDeleteListenTextField: UITextField {
    
    var deleteCallBack:((WMDeleteListenTextField)->Void)? = nil
    
    
    override func deleteBackward() {
        super.deleteBackward();
        if(self.deleteCallBack != nil){
            self.deleteCallBack!(self);
        }
    }
    
    
    
    

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
