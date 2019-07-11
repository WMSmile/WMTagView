//
//  CopyLabel.swift
//  WMTagView
//
//  Created by wumeng on 2019/7/11.
//  Copyright © 2019 wumeng. All rights reserved.
//

import UIKit

//MARK:- Label copy
class WMCopyableLabel: UILabel {
    
    override public var canBecomeFirstResponder: Bool {
        get {
            return true
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        WM_FUNC_initOthers();
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        WM_FUNC_initOthers()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        WM_FUNC_initOthers()
    }
   //MARK:- add LongPressGestureRecognizer
    func WM_FUNC_initOthers() {
        isUserInteractionEnabled = true
        addGestureRecognizer(UILongPressGestureRecognizer(
            target: self,
            action: #selector(showMenu(sender:))
        ))
    }
    //MARK:- copy
    override func copy(_ sender: Any?) {
        UIPasteboard.general.string = text
        UIMenuController.shared.setMenuVisible(false, animated: true)
    }
    
    /// show menu
    ///
    /// - Parameter sender:any
    @objc func showMenu(sender: Any?) {
        becomeFirstResponder()
        let menu = UIMenuController.shared
        if !menu.isMenuVisible {
            menu.setTargetRect(bounds, in: self)
            menu.setMenuVisible(true, animated: true)
        }
    }
    
    override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
        return (action == #selector(copy(_:)))
    }
}
