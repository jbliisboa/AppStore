//
//  TodayDetailSingleCell.swift
//  AppStore
//
//  Created by Admin on 04/06/20.
//  Copyright © 2020 João Lisboa. All rights reserved.
//

import UIKit

class TodayDetailSingleCell: UITableViewCell {
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        
        let attributeText = NSMutableAttributedString(string: "Lorem Ipsum", attributes: [NSAttributedString.Key.foregroundColor : UIColor.black])
        
        attributeText.append(NSAttributedString(string: " é simplismente uma simulação da indústria tipográfica e de empressos, e vem sendo utiliza desde o século XVI, quando um impressor desconhecido pegou uma bandeja de tipos e os embaralhou para fazer um livro de modelos de tipos.", attributes: [NSAttributedString.Key.foregroundColor : UIColor.gray]))
        
        attributeText.append(NSAttributedString(string: "\n\nDe onde ele vem?", attributes: [NSAttributedString.Key.foregroundColor : UIColor.black]))
        
        attributeText.append(NSAttributedString(string: " é simplismente uma simulação da indústria tipográfica e de empressos, e vem sendo utiliza desde o século XVI, quando um impressor desconhecido pegou uma bandeja de tipos e os embaralhou para fazer um livro de modelos de tipos.", attributes: [NSAttributedString.Key.foregroundColor : UIColor.gray]))
        
        label.attributedText = attributeText
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 0
        
        
        return label
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(descriptionLabel)
        descriptionLabel.fillSuperview(padding: .init(top: 24, left: 24, bottom: 24, right: 24))
        
        
    }
    required init?(coder: NSCoder) {
        fatalError()
    }
    
}
