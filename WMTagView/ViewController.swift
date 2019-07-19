//
//  ViewController.swift
//  WMTagView
//
//  Created by wumeng on 2019/7/10.
//  Copyright © 2019 wumeng. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
   

        
    }
   
    @IBAction func addTag(_ sender: Any) {
        let vc = AddTagViewController();
        self.navigationController?.pushViewController(vc, animated: true);
        
    }
    @IBAction func showTag(_ sender: Any) {
        let vc = ShowTagViewController();
        self.navigationController?.pushViewController(vc, animated: true);
    }
    @IBAction func checkbox(_ sender: Any) {
        
        let vc = CheckBoxViewController();
        self.navigationController?.pushViewController(vc, animated: true);
    }
    
}

