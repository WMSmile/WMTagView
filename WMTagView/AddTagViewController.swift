//
//  AddTagViewController.swift
//  WMTagView
//
//  Created by wumeng on 2019/7/11.
//  Copyright © 2019 wumeng. All rights reserved.
//

import UIKit

class AddTagViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white

        // Do any additional setup after loading the view.
        let baseView = WMTagView.init();
        self.view.addSubview(baseView);
        baseView.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.right.equalToSuperview()
            ConstraintMaker.top.equalToSuperview().offset(150)
            ConstraintMaker.bottom.equalTo(baseView.inputTF!)
        }
        //根据你添加的大小自行计算
        baseView.view_width = UIScreen.main.bounds.width;
        
        
        let label:WMCopyableLabel = WMCopyableLabel.init();
        self.view.addSubview(label)
        label.isUserInteractionEnabled = true
        label.text = "长按复制文本"
        label.textAlignment = .center;
        label.backgroundColor = UIColor.lightGray
        
        label.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.right.equalToSuperview();
            ConstraintMaker.top.equalToSuperview().offset(100);
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
