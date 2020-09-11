//
//  TodayDatailViewController.swift
//  AppStore
//
//  Created by Admin on 03/06/20.
//  Copyright © 2020 João Lisboa. All rights reserved.
//

import UIKit

class TodayDatailViewController: UIViewController {
    
    var centerView: UIView?
    var frame: CGRect?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .yellow
        
        
    }
    
    func animation () {
        
        guard let centerView = self.centerView else {return}
        guard let frame = self.frame else {return}
        
        print(centerView)
        print(frame)
        
    }
    
}
