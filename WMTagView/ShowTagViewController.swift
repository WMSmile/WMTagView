//
//  ShowTagViewController.swift
//  WMTagView
//
//  Created by wumeng on 2019/7/11.
//  Copyright © 2019 wumeng. All rights reserved.
//

import UIKit

class ShowTagViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white;

        // Do any additional setup after loading the view.
        
        let tagView = WMTagLabel.init(frame: CGRect.zero);
         self.view.addSubview(tagView)
        //tagView.backgroundColor = [UIColor purpleColor];
        
        let tags = [
        "标签tag1","表面","哈哈哈","测试测试","不不不不","无敌啊","标签","这样喊得好吗",
        "哈哈哈","嘻嘻嘻","呵呵呵","标签","表面兄弟","你好啊","不想你了哦","不要这样子啦"
        ];
        
        let attr = WMTagLabel.WM_FUNC_makeTagAttrs(tags) { (make) in
            make.strokeColor = UIColor.green
            make.fillColor = UIColor.clear
            make.strokeWidth = 1;
            make.cornerRadius = 100;
            make.insets =  UIEdgeInsets(top: -5, left: -5, bottom: -5, right: -5)
            make.font = UIFont.systemFont(ofSize: 14)
            make.textColor = UIColor.black
            make.lineSpace = 20;
            make.maxWidth = UIScreen.main.bounds.size.width;
            make.tagAlignment = .left;
        }
      
        tagView.attributedText = attr;
        tagView.textContainerInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)

        tagView.numberOfLines = 0;
        tagView.preferredMaxLayoutWidth = UIScreen.main.bounds.width;
        
//        print("\(attr.tagHeight)");
    
        tagView.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.right.equalToSuperview()
            ConstraintMaker.top.equalToSuperview().offset(100)

//            ConstraintMaker.height.equalTo(attr.tagHeight!)
        }
        
       
        
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
