//
//  SearchCell.swift
//  AppStore
//
//  Created by Admin on 25/05/20.
//  Copyright © 2020 João Lisboa. All rights reserved.
//

import UIKit
import SDWebImage

class SearchCell: UITableViewCell {
    
    var app: App! {
        didSet {
            titleLabel.text = app.nome
            companyLabel.text = app.empresa
            
            iconeImageView.sd_setImage(with: URL(string: app.iconeUrl), completed: nil)
            
            if let screenshotUrls = app.screenshotUrls{
                if screenshotUrls.count > 0 {
                    self.screenShot1ImageView.sd_setImage(with: URL(string: screenshotUrls[0]), completed: nil)
                }
                if screenshotUrls.count > 0 {
                    self.screenShot2ImageView.sd_setImage(with: URL(string: screenshotUrls[1]), completed: nil)
                }
                if screenshotUrls.count > 0 {
                    self.screenShot3ImageView.sd_setImage(with: URL(string: screenshotUrls[2]), completed: nil)
                }
            }
      
        }
    }
    
    let iconeImageView: UIImageView = .iconeImageView()
    let titleLabel: UILabel = .textLabel(text: "App name", fontSize: 18, numberOfLines: 2)
    let companyLabel: UILabel = .textLabel(text: "Company name", fontSize: 14)
    let getButton: UIButton = .getButton()
    
    let screenShot1ImageView: UIImageView = .screenShotImageView()
    let screenShot2ImageView: UIImageView = .screenShotImageView()
    let screenShot3ImageView: UIImageView = .screenShotImageView()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let titleCompanyStackView = UIStackView(arrangedSubviews: [titleLabel, companyLabel])
        titleCompanyStackView.spacing = 8
        titleCompanyStackView.axis = .vertical
        
        
        let headerStackView = UIStackView(arrangedSubviews: [iconeImageView, titleCompanyStackView, getButton])
        headerStackView.spacing = 12
        headerStackView.alignment = .center
        
        
        let screenShotStackView = UIStackView (arrangedSubviews: [screenShot1ImageView, screenShot2ImageView, screenShot3ImageView])
        
        screenShotStackView.spacing = 12
        screenShotStackView.distribution = .fillEqually
        
        let globalStackView = UIStackView (arrangedSubviews: [headerStackView, screenShotStackView])
        globalStackView.spacing = 16
        globalStackView.axis = .vertical
        
        
        addSubview(globalStackView)
        globalStackView.fillSuperview(padding: .init(top: 20, left: 20, bottom: 20, right: 20))
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    
    
}
