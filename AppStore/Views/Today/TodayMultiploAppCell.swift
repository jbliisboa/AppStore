//
//  TodayMultiploAppCell.swift
//  AppStore
//
//  Created by Admin on 24/06/20.
//  Copyright © 2020 João Lisboa. All rights reserved.
//

import UIKit

class TodayMultiploAppCell: UITableViewCell {
    
    var app: App? {
        didSet {
            if let app = app {
                iconImageView.sd_setImage(with: URL(string: app.iconeUrl), completed: nil)
                titleLabel.text = app.nome
                companyLabel.text = app.empresa
            }
        }
    }
    
    let iconImageView: UIImageView = .iconeImageView(width: 48, heigth: 48)
    let titleLabel: UILabel = .textLabel(text: "App name", fontSize: 16)
    let companyLabel: UILabel = .textLabel(text: "App Company", fontSize: 14)
    let getButton: UIButton = .getButton()
    
    var leadingConstraint: NSLayoutConstraint?
    var trailingConstraint: NSLayoutConstraint?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none
        
        let titleCompanyStackView = UIStackView(arrangedSubviews: [titleLabel, companyLabel])
        titleCompanyStackView.spacing = 16
        titleCompanyStackView.axis = .vertical
        
        let stackView = UIStackView(arrangedSubviews: [iconImageView, titleCompanyStackView, getButton])
        stackView.spacing = 16
        stackView.alignment = .center
        
        addSubview(stackView)
        stackView.fill(top: topAnchor, leading: nil, bottom: bottomAnchor, trailing: nil, padding: .init(top: 14, left: 0, bottom: 14, right: 0))
        
        self.leadingConstraint = stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0)
        self.trailingConstraint = stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0)
        
        self.leadingConstraint?.isActive = true
        self.trailingConstraint?.isActive = true
        
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
}
