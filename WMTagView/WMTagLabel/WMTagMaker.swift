//
//  WMTagMaker.swift
//  WMTagView
//
//  Created by wumeng on 2019/7/11.
//  Copyright © 2019 wumeng. All rights reserved.
//

import UIKit
enum WMTagAlignment {
    case left
    case center
    case right
}
class WMTagMaker: NSObject {
    //标签边框
    var strokeWidth:CGFloat = 0
    //标签边框颜色
    var strokeColor:UIColor = UIColor.gray
    //路径的连接点形状,] kCGLineJoinMiter(默认全部连接),kCGLineJoinRound(圆形连接),kCGLineJoinBevel(斜角连接)
    var lineJoin:CGLineJoin = .miter
    //标签内容内边距
    var insets:UIEdgeInsets = UIEdgeInsets.init(top: -5, left: 0, bottom: -5, right: 0)
    //标签圆5
    var cornerRadius:CGFloat = 2
    //标签填充颜色
    var fillColor:UIColor = UIColor.blue
    //字体大小
    var font:UIFont = UIFont.systemFont(ofSize: 14)
    //字体颜色
    var textColor:UIColor = UIColor.white
    //标签上下间距
    var lineSpace:CGFloat = 5
    //标签的最大宽度-》以便计算高度
    var maxWidth:CGFloat = UIScreen.main.bounds.width
    //对齐方式
    var  tagAlignment:WMTagAlignment = .left
   
}

private var WM_keys_tagHeight = "WM_keys_tagHeight"
extension NSMutableAttributedString {
   
    var tagHeight:CGFloat?{
            get {
                return objc_getAssociatedObject(self, &WM_keys_tagHeight) as? CGFloat
            }
            set {
                if let unWrapedValue = newValue {
                    objc_setAssociatedObject(self, &WM_keys_tagHeight,
                                             unWrapedValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
                }
            }
    }
    
}
