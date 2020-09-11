//
//  AppDetailHeaderCell.swift
//  AppStore
//
//  Created by Admin on 01/06/20.
//  Copyright © 2020 João Lisboa. All rights reserved.
//

import UIKit

class AppDetailHeaderCell: UICollectionViewCell {
    
    var app: App? {
        didSet{
            if let app = app {
                iconeImageView.sd_setImage(with: URL(string: app.iconeUrl), completed: nil)
                nameLabel.text = app.nome
                companyLabel.text = app.empresa
            }
        }
    }
    
    let iconeImageView: UIImageView = .iconeImageView(width: 128, heigth: 128)
    let nameLabel: UILabel = .textLabel(text: "App Name", fontSize: 20, numberOfLines: 2)
    let companyLabel: UILabel = .textLabel(text: "App Company", fontSize: 14)
    let getButton: UIButton = .getButton()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        iconeImageView.image = UIImage(named: "icone")
        
        
        let buttonStackView = UIStackView(arrangedSubviews: [getButton, UIView()])
        
        let titleCompanyStackView = UIStackView(arrangedSubviews: [nameLabel, companyLabel, buttonStackView])
        titleCompanyStackView.spacing = 12
        titleCompanyStackView.axis = .vertical
        
        let stackView = UIStackView(arrangedSubviews: [iconeImageView, titleCompanyStackView])
        stackView.alignment = .center
        stackView.spacing = 12
        
        
        
        addSubview(stackView)
        stackView.fillSuperview(padding: .init(top: 0, left: 20, bottom: 0, right: 20))
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
}
