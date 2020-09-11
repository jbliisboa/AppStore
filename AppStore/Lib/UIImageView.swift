//
//  UIImageView.swift
//  AppStore
//
//  Created by Admin on 25/05/20.
//  Copyright © 2020 João Lisboa. All rights reserved.
//

import UIKit

extension UIImageView{
    
    static func iconeImageView (width: CGFloat = 64, heigth: CGFloat = 64) -> UIImageView{
        
        let image = UIImageView()
        
        image.size(size: .init(width: width, height: heigth))
        image.backgroundColor = .purple
        image.layer.borderWidth = 0.5
        image.layer.borderColor = UIColor(white: 0.5, alpha: 0.5).cgColor
        image.layer.cornerRadius = 12
        image.clipsToBounds = true
        
        return image
        
    }
    
    static func screenShotImageView () -> UIImageView{
        
        let image = UIImageView()
        
        image.backgroundColor = .purple
        image.layer.cornerRadius = 12
        image.layer.borderWidth = 0.5
        image.layer.borderColor = UIColor(white: 0.5, alpha: 0.5).cgColor
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFill
        
        return image
    }
    
    static func todayImageView (named: String? = nil) -> UIImageView {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        if let named = named {
            image.image = UIImage(named: named)
        }
        image.contentMode = .scaleAspectFit
        return image
        
    }
    
}
