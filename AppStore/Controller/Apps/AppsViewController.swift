//
//  AppsViewController.swift
//  AppStore
//
//  Created by Admin on 31/05/20.
//  Copyright © 2020 João Lisboa. All rights reserved.
//

import UIKit

class AppsViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let cellId = "cellId"
    let headerId = "headerId"
    
    let activityIndicatorView: UIActivityIndicatorView = {
        let ai = UIActivityIndicatorView(style: .large)
        ai.color = UIColor.grayColor
        ai.startAnimating()
        ai.hidesWhenStopped = true
        return ai
    }()
    
    var appsFeatured: [AppsFeatured] = []
    var appsGroup: [AppGroup] = []
    
    
    init() {
        
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = .white
        
        collectionView.register(AppsGroupCell.self, forCellWithReuseIdentifier: cellId)
        
        collectionView.register(AppsHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerId)
        
        
        view.addSubview(activityIndicatorView)
        activityIndicatorView.centralizeSuperview()
        
        self.searchApps()
        
       
    }
}

extension AppsViewController {
    
    func searchApps () {
        
        var appsFeatured: [AppsFeatured]?
        var appsWeLove: AppGroup?
        var topFreeApps: AppGroup?
        var topPaidApps: AppGroup?
        
        let dispatchGroup = DispatchGroup ()
        
        dispatchGroup.enter()
        AppService.shared.searchAppsFeatured { (apps, error) in
            appsFeatured = apps
            dispatchGroup.leave()
            
        }
        
        dispatchGroup.enter()
        AppService.shared.searchGroup(type: "apps-que-amamos") { (group, error) in
            appsWeLove = group
            dispatchGroup.leave()
            
        }
        dispatchGroup.enter()
        AppService.shared.searchGroup(type: "top-apps-gratis") { (group, error) in
            topFreeApps = group
            dispatchGroup.leave()
            
        }
        dispatchGroup.enter()
        AppService.shared.searchGroup(type: "top-apps-pagos") { (group, error) in
            topPaidApps = group
            dispatchGroup.leave()
            
        }
        
        dispatchGroup.notify(queue: .main) {
            if let apps = appsFeatured {
                self.appsFeatured = apps
            }
            
            if let apps = appsWeLove {
                self.appsGroup.append(apps)
            }
            
            if let apps = topFreeApps {
                self.appsGroup.append(apps)
            }
            
            if let apps = topPaidApps {
                self.appsGroup.append(apps)
            }
            
            
            self.activityIndicatorView.stopAnimating()
            self.collectionView.reloadData()
        }
        
    }
  
}

extension AppsViewController{
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId, for: indexPath) as! AppsHeader
        header.appFeatured = self.appsFeatured
        header.collectionView.reloadData()
        
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 20, left: 0, bottom: 20, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return .init(width: view.bounds.width, height: view.bounds.width * 0.8)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.appsGroup.count
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! AppsGroupCell
        cell.group = self.appsGroup[indexPath.item]
        cell.appsGroupHorizontalViewController.callBack = {(app) in
            let appDetailViewController = AppDetailViewController()
            appDetailViewController.appId = app.id
            appDetailViewController.app = app
            self.navigationController?.pushViewController(appDetailViewController, animated: true)
            
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.bounds.width, height: 280)
    }
    
    
}
