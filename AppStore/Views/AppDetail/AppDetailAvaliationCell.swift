//
//  AppDetailAvaliationCell.swift
//  AppStore
//
//  Created by Admin on 02/06/20.
//  Copyright © 2020 João Lisboa. All rights reserved.
//

import UIKit

class AppDetailAvaliationCell: UICollectionViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var app: App? {
        didSet {
            if app != nil {
                self.collectionView.reloadData()
                
            }
        }
    }
    
    let cellId = "cellId"
    
    let titleLabel: UILabel = .textBoldLabel(text: "Avaliação e opniões", fontSize: 24)
    
    var collectionView: UICollectionView!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let layout = SnappingLayout()
        layout.scrollDirection = .horizontal
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.decelerationRate = .fast
        collectionView.register(ComentaryCell.self, forCellWithReuseIdentifier: cellId)
        
        addSubview(titleLabel)
        titleLabel.fill(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 20, left: 20, bottom: 0, right: 20))
        
        addSubview(collectionView)
        collectionView.fill(top: titleLabel.bottomAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 20, left: 0, bottom: 0, right: 0))
        
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.app?.comentarios?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! ComentaryCell
        
        if let comentary = self.app?.comentarios?[indexPath.item] {
            cell.comentary = comentary
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: collectionView.bounds.width - 40, height: collectionView.bounds.height)
    }
    
}

class ComentaryCell: UICollectionViewCell {
    
    var comentary: AppComentario? {
        didSet {
            if let comentary = comentary {
                titleLabel.text = comentary.titulo
                comentaryLabel.text = comentary.descricao
                avaliationImageView.image = UIImage(named: "avaliacao-\(comentary.avaliacao)")
            }
        }
    }
    
    let titleLabel: UILabel = .textBoldLabel(text: "Avaliação", fontSize: 16)
    let comentaryLabel: UILabel = .textLabel(text: "Comentário", fontSize: 16, numberOfLines: 0)
    
    let avaliationImageView: UIImageView = {
        let image = UIImageView()
        image.size(size: .init(width: 120, height: 24))
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor.background
        
        layer.cornerRadius = 12
        layer.masksToBounds = true
        clipsToBounds = true
        
        avaliationImageView.image = UIImage(named: "avaliacao-4")
        
        let headerStackView = UIStackView(arrangedSubviews: [titleLabel, avaliationImageView])
        
        let comentaryStackView = UIStackView(arrangedSubviews: [comentaryLabel])
        comentaryStackView.alignment = .top
        
        let stackView = UIStackView(arrangedSubviews: [headerStackView, comentaryStackView])
        stackView.axis = .vertical
        stackView.spacing = 12
        
        
        addSubview(stackView)
        stackView.fillSuperview(padding: .init(top: 20, left: 20, bottom: 20, right: 20))
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
