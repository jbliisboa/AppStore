//
//  AppsGroupCell.swift
//  AppStore
//
//  Created by Admin on 31/05/20.
//  Copyright © 2020 João Lisboa. All rights reserved.
//

import UIKit

class AppsGroupCell: UICollectionViewCell {
    
    var group: AppGroup? {
        didSet {
            if let group = group {
                titleLabel.text = group.titulo
                appsGroupHorizontalViewController.apps = group.apps
            }
        }
    }
    
    let titleLabel: UILabel = .textBoldLabel(text: "Apps title group", fontSize: 24)
    
    let appsGroupHorizontalViewController = AppsGroupHorizontalViewController()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(titleLabel)
        titleLabel.fill(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 0, left: 20, bottom: 0, right: 20))
        
        addSubview(appsGroupHorizontalViewController.view)
        appsGroupHorizontalViewController.view.fill(top: titleLabel.bottomAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 10, left: 0, bottom: 0, right: 0))
        
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    
}
