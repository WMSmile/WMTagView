//
//  WMTagLabel.swift
//  WMTagView
//
//  Created by wumeng on 2019/7/11.
//  Copyright © 2019 wumeng. All rights reserved.
//

import UIKit
import YYKit

class WMTagLabel: YYLabel {
    
    var tags:[String] = []
    
    var tagheight:CGFloat = 0 //tag height
    
    //MARK:- <#Description#>
    class func WM_FUNC_makeTagAttrs(_ tags:[String],_ tagMaker:((WMTagMaker) -> Void)?) -> NSMutableAttributedString {
        let attr:NSMutableAttributedString  = NSMutableAttributedString.init();
        
        var height:CGFloat = 0;
        let maker = WMTagMaker.init()
        if tagMaker != nil {
            tagMaker!(maker)
        }
        print("\(maker.description)")
        for item in tags.enumerated() {
            let i  = item.offset;
            let tagStr = item.element
            
            let tagAttr = NSMutableAttributedString.init(string: tagStr)
            tagAttr.insertString("   ", at: 0)
            tagAttr.appendString("   ")
            tagAttr.font = maker.font
            tagAttr.color = maker.textColor
            tagAttr.setTextBinding(YYTextBinding.init(deleteConfirm: false), range: tagAttr.rangeOfAll())
            
            //外观
            tagAttr.setTextBackgroundBorder(self.WM_FUNC_creattextBoard(maker), range: (tagAttr.string as NSString).range(of: tagStr))
            
            attr.lineSpacing = maker.lineSpace
            attr.lineBreakMode = .byWordWrapping
            
            let tagContainer = YYTextContainer()
            tagContainer.size  = CGSize.init(width: maker.tagAlignment == .right ? (maker.maxWidth - abs(maker.insets.right)) : (maker.maxWidth - abs(maker.insets.left)), height: CGFloat(MAXFLOAT))
            
            let tagLayout = YYTextLayout.init(container: tagContainer, text: tagAttr)
            
            if (tagLayout!.textBoundingSize.height > height) {
                if (i != 0) {
                    attr.insertString("\n", at: UInt(attr.length - tagAttr.length))
                }
                height = tagLayout!.textBoundingSize.height;
            }
            attr.append(tagAttr);
            
        }
        
        attr.tagHeight = height + maker.lineSpace;
        attr.addAttribute(NSAttributedString.Key.paragraphStyle, value: self.WM_FUNC_createTextStyle(maker), range: NSMakeRange(0, attr.length))
        
        
        
        return attr;

        
    }

    
    //MARK:- <#Description#>
    class func WM_FUNC_creattextBoard(_ maker:WMTagMaker) -> YYTextBorder {
        
        let border = YYTextBorder();
        border.strokeWidth = maker.strokeWidth;
        border.strokeColor = maker.strokeColor;
        border.fillColor = maker.fillColor;
        border.cornerRadius = maker.cornerRadius; // a huge value
        border.lineJoin = maker.lineJoin;
        border.insets = maker.insets;
        return border;
    }

    //MARK:- <#Description#>
    class func WM_FUNC_createTextStyle(_ maker:WMTagMaker) -> NSMutableParagraphStyle {
        let style = NSMutableParagraphStyle.init()
        style.lineSpacing =  maker.lineSpace;
        switch (maker.tagAlignment) {
        case .left:
            style.alignment = NSTextAlignment.left;
            //style.firstLineHeadIndent = fabs(maker.insets.left) ;//设置与首部的距离
            break;
        case .center:
            style.alignment = NSTextAlignment.center;
            break;
        case .right:
            style.alignment = NSTextAlignment.right;
            style.tailIndent = maker.insets.right - 2; //设置与尾部的距离
            break;
        default:
            break;
        }
        return style;
    }

   
    
    

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
