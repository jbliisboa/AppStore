//
//  TodayCell.swift
//  AppStore
//
//  Created by Admin on 03/06/20.
//  Copyright © 2020 João Lisboa. All rights reserved.
//

import UIKit

class TodayCell: UICollectionViewCell {
    
    var todayApp: TodayApp? {
        
        didSet {
            if let todayApp = todayApp {
                
                categoryLabel.text = todayApp.categoria
                titleLabel.text = todayApp.titulo
                descriptionLabel.text = todayApp.descricao
                
                if let image = todayApp.imagemUrl {
                    imageView.image = UIImage(named: image)
                    
                }
                
                if let background = todayApp.backgroundColor {
                    self.backgroundColor = UIColor(hexString: background)
                    
                }
                
                
                
            }
        }
        
    }
    
    let categoryLabel: UILabel = .textLabel(text: "Travel", fontSize: 18)
    let titleLabel: UILabel = .textBoldLabel(text: "Explore the world\nwithout fear", fontSize: 28, numberOfLines: 2)
    let imageView: UIImageView = .todayImageView(named: "destaque-1")
    let descriptionLabel: UILabel = .textLabel(text: "Podemos viajar o mundo em busca de beleza, mas nunca a encontraremos se não a carregarmos dentro de nós", fontSize: 14, numberOfLines: 3)
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        layer.cornerRadius = 16
        clipsToBounds = true
        
        let boxView = UIView()
        boxView.clipsToBounds = true
        boxView.addSubview(imageView)
        
        imageView.centerXAnchor.constraint(equalTo: boxView.centerXAnchor).isActive = true
        imageView.centerYAnchor.constraint(equalTo: boxView.centerYAnchor).isActive = true
        imageView.size(size: .init(width: bounds.width, height: 250))
        
        
        let stackView = UIStackView(arrangedSubviews: [categoryLabel, titleLabel, boxView, descriptionLabel])
        stackView.axis = . vertical
        stackView.spacing = 8
        
        addSubview(stackView)
        //        stackView.fillSuperview(padding: .init(top: 24, left: 24, bottom: 24, right: 24))
        stackView.fill(top: self.safeAreaLayoutGuide.topAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 24, left: 24, bottom: 24, right: 24))
        
    }
    required init?(coder: NSCoder) {
        fatalError()
    }
}
