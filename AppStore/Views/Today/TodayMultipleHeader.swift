//
//  TodayMultipleHeader.swift
//  AppStore
//
//  Created by Admin on 25/06/20.
//  Copyright © 2020 João Lisboa. All rights reserved.
//

import UIKit

class TodayMultipleHeader: UIView {
    
    var todayApp: TodayApp? {
        didSet {
            if let todayApp = todayApp {
                categoryLabel.text = todayApp.categoria
                titleLabel.text = todayApp.titulo
            }
            
        }
        
    }
    
    let categoryLabel: UILabel = .textLabel(text: "VIAGEM", fontSize: 18)
    let titleLabel: UILabel = .textBoldLabel(text: "Explore o mundo \nsem medo", fontSize: 28, numberOfLines: 2)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let stackView = UIStackView(arrangedSubviews: [categoryLabel, titleLabel])
            stackView.axis = .vertical
            stackView.spacing = 8
            
            addSubview(stackView)
            stackView.fill(top: self.safeAreaLayoutGuide.topAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 24, left: 24, bottom: 24, right: 24))
 
        
    }
    required init?(coder: NSCoder) {
        fatalError()
    }
}
