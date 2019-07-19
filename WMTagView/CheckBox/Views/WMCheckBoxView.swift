//
//  WMCheckBoxView.swift
//  WMTagView
//
//  Created by wumeng on 2019/7/19.
//  Copyright © 2019 wumeng. All rights reserved.
//

import UIKit
import SnapKit

class WMCheckBoxView: UIView ,UITableViewDelegate,UITableViewDataSource{
    
    var listTableView:UITableView?
    let identifer = "WMCheckBoxView"
    
    var isMultiple:Bool = false//是否多选
    
    var sourceList:[WMSelectedItemProtocol] = []{
        didSet{
            initSelectedData();
        }
    }
    var selectedSourceList:[WMSelectedItemProtocol] = []{
        didSet{
            //刷新数据
            WM_FUNC_updateData();
        }
    }
    //    var note:String = "";
    
    var listTVHeight:Constraint?
    
    var finishCallBack:((_ selectedList:[WMSelectedItemProtocol],_ otherStr:String) -> Void)? = nil;
    
    
    override init(frame: CGRect) {
        super.init(frame: frame);
        initViews();
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK:-
    func initViews() -> Void {
        
        // Do any additional setup after loading the view.
        self.backgroundColor = UIColor.white;
        
        
        self.createTableView();
        
        
        //MARK:- makeConstraints
        listTableView?.snp.makeConstraints({ (ConstraintMaker) in
            ConstraintMaker.left.top.right.equalToSuperview();
            self.listTVHeight = ConstraintMaker.bottom.equalTo((self.listTableView?.snp.top)!).offset(200).constraint;
            ConstraintMaker.bottom.equalToSuperview().offset(0 * APP_SCRAL)
        })
        
        //更新数据
        self.WM_FUNC_updateData();
        
    }
    
    
    //MARK:- 创建tableview
    func createTableView() -> Void {
        listTableView = UITableView.init();
        listTableView?.delegate = self;
        listTableView?.dataSource = self;
        self.addSubview(listTableView!);
        listTableView?.register(WMCheckBoxItemSelectCell.self, forCellReuseIdentifier: identifer);
        listTableView?.separatorStyle = .none;
        listTableView?.estimatedRowHeight = 60;
        listTableView?.rowHeight = UITableView.automaticDimension;
        
    }
    //MARK:- tableview dataSourceDelegate
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sourceList.count;
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:WMCheckBoxItemSelectCell = tableView.dequeueReusableCell(withIdentifier: identifer) as! WMCheckBoxItemSelectCell;
        let model = sourceList[indexPath.row];
        let isContain = self.sourceList[indexPath.row].getIsSelected?() ?? false;
        cell.WM_FUNC_UpdateCheckType(self.isMultiple)
        cell.setDataForViews(info: model, isSelected: isContain);
        
        return cell;
    }
    //MARK:- tableview delegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true);
        
        if !isMultiple {
            //单选
            self.initSelectedData();
        }
        let model = sourceList[indexPath.row];
        model.updateIsSelected?(!(model.getIsSelected?() ?? false))
        self.listTableView?.reloadData();
        
    }
    
    //MARK:- <#Description#>
    func WM_FUNC_updateData() -> Void {
        
        self.listTableView?.reloadData();
    }
    
    
    //MARK:- 初始化
    func initSelectedData() -> Void {
        for item in sourceList {
            item.updateIsSelected?(false)
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews();
        print("\(self.listTableView?.contentSize)")
        self.listTVHeight?.update(offset: self.listTableView?.contentSize.height ?? 0);
        
    }
    
    
    
    
    
    
    
    
    
    
    
    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */
    
}

//MARK:- WMCheckBoxItemSelectCell
class WMCheckBoxItemSelectCell: UITableViewCell {
    
    var selectedBtn:UIButton?
    var namelLB:UILabel?

    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier);
        
        initViews();
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initViews() -> Void {
        
        self.selectedBtn = UIButton.init(type: .custom);
        //        selectedBtn?.setImage(UIImage(named: "icon_selected1"), for: .normal);
        //        selectedBtn?.setImage(UIImage(named: "icon_selected2"), for: .selected);
        selectedBtn?.setImage(UIImage(named: "icon_muti_select"), for: .normal);
        selectedBtn?.setImage(UIImage(named: "icon_muti_selected"), for: .selected);
        selectedBtn?.isUserInteractionEnabled = false;
        self.contentView.addSubview(selectedBtn!);
        
        self.namelLB = UILabel.createNewLable(font: UIFont.systemFont(ofSize: 13 * APP_SCRAL), textColor: UIColor.black, text: "名字");
        //        self.namelLB?.lineBreakMode = .byTruncatingMiddle;
        self.namelLB?.numberOfLines = 0;
        self.contentView.addSubview(namelLB!);
        namelLB?.text = "选择的名字";
        
        //MARK:- 约束
        
        selectedBtn?.snp.makeConstraints({ (ConstraintMaker) in
            ConstraintMaker.left.equalToSuperview().offset(15 * APP_SCRAL);
            ConstraintMaker.centerY.equalToSuperview();
            ConstraintMaker.height.width.equalTo(20);
        })
        
        namelLB?.snp.makeConstraints({ (ConstraintMaker) in
            ConstraintMaker.left.equalTo((selectedBtn?.snp.right)!).offset(5 * APP_SCRAL);
            ConstraintMaker.top.bottom.equalToSuperview();
            ConstraintMaker.right.equalToSuperview().offset(-10 * APP_SCRAL);
            ConstraintMaker.height.greaterThanOrEqualTo(40 * APP_SCRAL)
        })
        
        
    }
    
    
    func setDataForViews(info:WMSelectedItemProtocol,isSelected:Bool) -> Void {
        
        self.namelLB?.text = info.getTitle!();
        
        self.selectedBtn?.isSelected = isSelected;
        
        
        
    }
    
    
    //MARK:- <#Description#>
    func WM_FUNC_UpdateCheckType(_ isMultiple:Bool) -> Void {
        
        if (isMultiple) {
            selectedBtn?.setImage(UIImage(named: "icon_muti_select"), for: .normal);
            selectedBtn?.setImage(UIImage(named: "icon_muti_selected"), for: .selected);
        }
        else{
            selectedBtn?.setImage(UIImage(named: "icon_selected1"), for: .normal);
            selectedBtn?.setImage(UIImage(named: "icon_selected2"), for: .selected);
        }
        
        
        
    }
    
    
    
}
