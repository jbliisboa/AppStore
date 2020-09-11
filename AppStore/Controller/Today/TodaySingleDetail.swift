//
//  TodaySingleDetail.swift
//  AppStore
//
//  Created by Admin on 04/06/20.
//  Copyright © 2020 João Lisboa. All rights reserved.
//

import UIKit

class TodaySingleDetail: UITableViewController {
    
    let cellId = "cellId"
    
    var todayApp: TodayApp?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        tableView.backgroundColor = .white
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
        tableView.contentInsetAdjustmentBehavior = .never
        tableView.register(TodayDetailSingleCell.self, forCellReuseIdentifier: cellId)
        
        self.addHeader()
    }
    
    func addHeader () {
        
        let headerView = UIView (frame: .init(x: 0, y: 0, width: view.bounds.width, height: view.bounds.width + 48))
        
        let todayCell = TodayCell()
        todayCell.todayApp = self.todayApp
        todayCell.layer.cornerRadius = 0
        
        headerView.addSubview(todayCell)
        todayCell.fillSuperview()
        
        self.tableView.tableHeaderView = headerView
        
    }
}

extension TodaySingleDetail {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! TodayDetailSingleCell
        
        return cell
    }
    
    
}
