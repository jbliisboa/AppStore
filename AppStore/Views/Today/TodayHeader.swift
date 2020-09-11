//
//  TodayHeader.swift
//  AppStore
//
//  Created by Admin on 27/08/20.
//  Copyright © 2020 João Lisboa. All rights reserved.
//

import UIKit

class TodayHeader: UICollectionReusableView {
    
    let dataLabel: UILabel = .textLabel(text: "Domingo, 1 DE MARÇO", fontSize: 14)
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Today"
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 34)
        return label
    }()
    
    let perfilImageView: UIImageView = {
        let image = UIImageView()
        image.size(size: .init(width: 36, height: 36))
        image.layer.cornerRadius = 18
        image.clipsToBounds = true
        image.image = UIImage(named: "perfil")
        image.contentMode = .scaleAspectFill
        return image
        
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(dataLabel)
        dataLabel.fill(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 32, left: 24, bottom: 0, right: 0))
        
        addSubview(titleLabel)
        titleLabel.fill(top: nil, leading: leadingAnchor, bottom: bottomAnchor, trailing: nil, padding: .init(top: 0, left: 24, bottom: 0, right: 0))
        
        addSubview(perfilImageView)
        perfilImageView.fill(top: nil, leading: nil, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 24))
        
    }
    required init?(coder: NSCoder) {
        fatalError()
    }
}
