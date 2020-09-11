//
//  UIBotton.swift
//  AppStore
//
//  Created by Admin on 25/05/20.
//  Copyright © 2020 João Lisboa. All rights reserved.
//

import UIKit

extension UIButton{
    
    static func getButton() -> UIButton{
        
        let button = UIButton(type: .system)
        
        button.setTitle("Obter", for: .normal)
        button.setTitleColor(UIColor.blueColor, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.backgroundColor = UIColor(white: 0.95, alpha: 1)
        
        button.size(size: .init(width: 80, height: 32))
        button.layer.cornerRadius = 16
        button.clipsToBounds = true
        
        
        return button
    }
    
    static func buttonClose () -> UIButton {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "close"), for: .normal)
        button.layer.zPosition = 2
        return button
        
        
    }
    
}
