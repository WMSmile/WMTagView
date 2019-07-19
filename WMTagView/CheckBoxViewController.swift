//
//  CheckBoxViewController.swift
//  WMTagView
//
//  Created by wumeng on 2019/7/19.
//  Copyright © 2019 wumeng. All rights reserved.
//

import UIKit

class CheckBoxViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.lightGray
        // Do any additional setup after loading the view.
        
        let label = UILabel.createNewLable(font: UIFont.systemFont(ofSize: 16), textColor: UIColor.blue, text: "八条禁止是否做到")
        self.view.addSubview(label)
        
        
        let chooseView = WMCheckBoxView();
        chooseView.isMultiple = true
        self.view.addSubview(chooseView)
        chooseView.sourceList = [
            WMCheckBoxModel.init("1", "①、严禁店内经营竞品、仿冒品及其他无关产品；"),
            WMCheckBoxModel.init("2", "②、严禁擅自改造门头及店内展台道具；"),
            WMCheckBoxModel.init("3", "③、严禁店内存在脏乱差、无关杂物乱堆放"),
            WMCheckBoxModel.init("4", "④、严禁展区存在淘汰样机不下架、过期物料不撤除、POP布置不匹配等终端布置问题；"),
            WMCheckBoxModel.init("5", "⑤、严禁未经报批擅自闭店后隐瞒不报；"),
            WMCheckBoxModel.init("6", "⑥、严禁营业时间店内人员奇装异服、形象邋遢；"),
            WMCheckBoxModel.init("7", "⑦、严禁店内人员为争取订单散播不实言论诋毁区域内其他格力门店；"),
            WMCheckBoxModel.init("8", "⑧、严禁店内人员在营业时间内从事与工作无关的行为及活动，如聚众赌博打牌、看电视、煮饭烧菜等。")
        ]
        
        
        let label1 = UILabel.createNewLable(font: UIFont.systemFont(ofSize: 16), textColor: UIColor.blue, text: "是否爱我？")
        self.view.addSubview(label1)
        let chooseView1 = WMCheckBoxView();
        chooseView1.isMultiple = false
        self.view.addSubview(chooseView1)
        chooseView1.sourceList = [
            WMCheckBoxModel.init("1", "是"),
            WMCheckBoxModel.init("2", "否"),
        ]
        
        
        
        label.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.right.equalToSuperview();
            ConstraintMaker.left.equalToSuperview().offset(15 * APP_SCRAL)
            ConstraintMaker.height.equalTo(40 * APP_SCRAL)
            
        }
        chooseView.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.equalTo(label.snp.bottom).offset(0)
            ConstraintMaker.left.right.equalToSuperview();
        }
        
        label1.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.equalTo(chooseView.snp.bottom).offset(10)
            ConstraintMaker.right.equalToSuperview();
            ConstraintMaker.left.equalToSuperview().offset(15 * APP_SCRAL)
            ConstraintMaker.height.equalTo(40 * APP_SCRAL)
        }
        
        chooseView1.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.top.equalTo(label1.snp.bottom).offset(0)
            ConstraintMaker.left.right.equalToSuperview();
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
