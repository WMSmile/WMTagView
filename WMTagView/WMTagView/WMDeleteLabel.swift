//
//  WMDeleteLabel.swift
//  WMTagView
//
//  Created by wumeng on 2019/7/10.
//  Copyright © 2019 wumeng. All rights reserved.
//

import UIKit


class WMDeleteLabel: UILabel {
    
    var delegate:WMLabelDelegate? = nil
    
    override public var canBecomeFirstResponder: Bool {
        get {
            return true
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib();
        self.initViews();
    }

    override init(frame: CGRect) {
        super.init(frame: frame);
        self.initViews();
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK:-
    func initViews() -> Void {
        
        
        self.isUserInteractionEnabled = true;
        
        let tap:UITapGestureRecognizer = UITapGestureRecognizer.init(target: self, action: #selector(WM_FUNC_tapGestureClick(_:)))
        self.addGestureRecognizer(tap)
        
        
        
    }
    
    
    //MARK:- 轻拍手势
    @objc func WM_FUNC_tapGestureClick(_ sender:UITapGestureRecognizer) -> Void {

        let bool = self.becomeFirstResponder()
        print("\(bool)")
        
        let menu = UIMenuController.shared
         if !menu.isMenuVisible {
            let delMenu = UIMenuItem.init(title: "删除", action: #selector(WM_FUNC_deleteClick))
            menu.menuItems = [delMenu]
            menu.setTargetRect(self.frame, in: self.superview!);
            menu.setMenuVisible(true, animated: true)
        }
  
        
    }
    override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
        
        return (action == #selector(WM_FUNC_deleteClick))
//        return true;
    }
    
    //MARK:- 点击了删除按钮
    @objc func WM_FUNC_deleteClick() -> Void {
        if self.delegate != nil{
            self.delegate?.WM_FUNC_WMLabel_deleteClick(self);
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


protocol WMLabelDelegate {
    //MARK:- <#Description#>
    func WM_FUNC_WMLabel_deleteClick(_ label:WMDeleteLabel)
}
extension WMLabelDelegate{
    func WM_FUNC_WMLabel_deleteClick(_ label:WMDeleteLabel){}
}

