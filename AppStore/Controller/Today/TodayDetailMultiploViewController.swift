//
//  TodayDetailMultiploViewController.swift
//  AppStore
//
//  Created by Admin on 24/06/20.
//  Copyright © 2020 João Lisboa. All rights reserved.
//

import UIKit

class TodayDetailMultiploViewController: UITableViewController {
    
    var todayApp: TodayApp? {
        didSet {
            if let todayApp = todayApp {
                let header = TodayMultipleHeader(frame: .init(x: 0, y: 0, width: view.bounds.width, height: 145))
                header.todayApp = todayApp
                
                tableView.tableHeaderView = header
                tableView.reloadData()
                
            }
        }
        
    }
    
    let cellId = "cellId"
    
    var handlerClique: ((App) -> ())?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 90, bottom: 0, right: 24)
        tableView.register(TodayMultiploAppCell.self, forCellReuseIdentifier: cellId)
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.todayApp?.apps?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! TodayMultiploAppCell
        
        cell.app = self.todayApp?.apps?[indexPath.item]
        cell.leadingConstraint?.constant = 24
        cell.trailingConstraint?.constant = -24
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let app = self.todayApp?.apps?[indexPath.item] {
            self.handlerClique?(app)
        }
    }
    
}
