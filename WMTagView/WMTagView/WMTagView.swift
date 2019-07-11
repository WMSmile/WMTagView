//
//  WMTagView.swift
//  WMTagView
//
//  Created by wumeng on 2019/7/11.
//  Copyright © 2019 wumeng. All rights reserved.
//

import UIKit
import SnapKit


class WMTagView: UIView ,WMLabelDelegate,UITextFieldDelegate{
    
    var inputTF:WMDeleteListenTextField?
    
    var tags:[String] = []
    
    var point_x:CGFloat = 10
    var point_y:CGFloat = 10
    
    var view_width:CGFloat = 300;
    
    private var count:Int = 0;

    
    override init(frame: CGRect) {
        super.init(frame: frame);
        initViews();
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK:-
    func initViews() -> Void {
        point_y = 10;
        point_x = 10;
        
        self.inputTF = WMDeleteListenTextField.init()
        inputTF?.borderStyle = .none;
        inputTF?.font = UIFont.systemFont(ofSize: 14)
//        self.addSubview(inputTF!)
        inputTF?.delegate = self
        
        inputTF?.deleteCallBack = {[unowned self] (textfield)in
            print("delete 99999");
            if(textfield.text!.isEmpty){
                self.WM_FUNC_textfield_deleteClick();
            }
            
        }
        
        
        
        
        self.WM_FUNC_UpdateTFFrame()
        
        
        
        
    }

    //MARK:- <#Description#>
    func WM_FUNC_layoutTagsView() -> Void {
        point_y = 10;
        point_x = 10;
        for view in self.subviews {
            if(view.isKind(of: WMDeleteLabel.self))
            {
                view.removeFromSuperview()
            }
        }
        for item in self.tags.enumerated() {
        
            let str = item.element;
            let i = item.offset;
            let size = WMUtils.WM_FUNC_getSizeByString(str: str, font: 14, boundSize: CGSize.init(width: Double(MAXFLOAT), height: 30.0))
            
            if (size.width + 20 + point_x > self.view_width) {
                point_x = 10;
                point_y = point_y+40;
            }
            let label = WMDeleteLabel.init();
            label.font = UIFont.systemFont(ofSize: 14)
            label.textAlignment = .center
            label.layer.borderColor = UIColor.green.cgColor
            label.layer.cornerRadius = 15
            label.layer.borderWidth = 1
            label.tag = 100 + i
            label.delegate = self
            self.addSubview(label)
            label.text = str
            label.frame = CGRect.init(x: point_x, y: point_y, width: size.width + 20, height: 30);
            point_y = label.frame.origin.y
            point_x = label.frame.maxX + 10;
            
            
        }

        self.WM_FUNC_UpdateTFFrame()
 
    }

    
    
    //MARK:- update textField Frame
    func WM_FUNC_UpdateTFFrame() -> Void {
        inputTF?.placeholder = "请输入标签"
        self.addSubview(inputTF!)
        inputTF?.snp.remakeConstraints({ (ConstraintMaker) in
            let size = WMUtils.WM_FUNC_getSizeByString(str: inputTF?.placeholder ?? "", font: 14, boundSize: CGSize.init(width: Double(MAXFLOAT), height: 30.0))
            ConstraintMaker.size.equalTo(CGSize.init(width: size.width, height: 30))
            if (size.width + point_x + 10 > self.view_width - 1) {
                point_x = 10;
                point_y = 40+point_y;
            }
            ConstraintMaker.top.equalToSuperview().offset(point_y);
            ConstraintMaker.left.equalToSuperview().offset(point_x);
        })

        
        
    }
    
    //MARK:- UITextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if !(textField.text?.isEmpty ?? false){
            self.tags.append(textField.text!)
            self.WM_FUNC_layoutTagsView()
            textField.text = "";
        }
        return true
        
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {

        return true
    }
    
    //MARK:- <#Description#>
    func WM_FUNC_textfield_deleteClick() -> Void {
        if count >= 1 {
            if (self.tags.count > 0){
                self.tags.removeLast();
                self.WM_FUNC_layoutTagsView();
            }
            self.count = 0
        }else{
            self.count +=  1
        }

    }

    
    //MARK:- WMDeleteLabeldelegate
    func WM_FUNC_WMLabel_deleteClick(_ label: WMDeleteLabel) {
        if (self.tags.count > 0){
            for item in self.tags.enumerated() {
                if (item.element == label.text){
                    self.tags.remove(at: item.offset);
                    self.WM_FUNC_layoutTagsView();
                }
            }
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
