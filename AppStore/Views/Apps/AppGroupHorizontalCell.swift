//
//  AppGroupHorizontalCell.swift
//  AppStore
//
//  Created by Admin on 31/05/20.
//  Copyright © 2020 João Lisboa. All rights reserved.
//

import UIKit

class AppsGroupHorizontalCell: UICollectionViewCell {
    
    var app: App? {
        didSet {
            if let app = app {
                iconeImageView.sd_setImage(with: URL(string: app.iconeUrl), completed: nil)
                titleLabel.text = app.nome
                companyLabel.text = app.empresa
            }
        }
    }
    
    let iconeImageView: UIImageView = .iconeImageView()
    let titleLabel: UILabel = .textLabel(text: "App Name", fontSize: 18, numberOfLines: 2)
    let companyLabel: UILabel = .textLabel(text: "App Company", fontSize: 14)
    let getButton: UIButton = .getButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        
        let bottomLine = CALayer()
        bottomLine.frame = CGRect (x: 80, y: bounds.height, width: bounds.width - 80, height: 0.8)
        bottomLine.backgroundColor = UIColor.grayColor.cgColor
        layer.addSublayer(bottomLine)
        
        
        let titleCompanyStackView = UIStackView(arrangedSubviews: [titleLabel, companyLabel])
        titleCompanyStackView.spacing = 4
        titleCompanyStackView.axis = .vertical
        
        let stackView = UIStackView(arrangedSubviews: [iconeImageView,titleCompanyStackView, getButton])
        stackView.spacing = 12
        stackView.alignment = .center
        
        
        addSubview(stackView)
        stackView.fillSuperview()
        
    }
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    
}
