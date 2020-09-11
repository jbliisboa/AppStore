//
//  SearchViewController.swift
//  AppStore
//
//  Created by Admin on 25/05/20.
//  Copyright © 2020 João Lisboa. All rights reserved.
//

import UIKit

class SearchViewController: UITableViewController, UISearchBarDelegate {
    
    let cellId = "cellId"
    
    let searchController = UISearchController(searchResultsController: nil)
    
    var apps:[App] = []
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(SearchCell.self, forCellReuseIdentifier: cellId)
        
        self.configurationSearchBar()
    }
    
    func configurationSearchBar (){
        navigationItem.searchController = self.searchController
        
        self.searchController.obscuresBackgroundDuringPresentation = false
        self.searchController.searchBar.placeholder = "App Store"
        self.searchController.searchBar.delegate = self
        
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String){
        self.searchApps(text: searchText)
    }
    
}

extension SearchViewController{
    
    func searchApps (text: String){
        
        SearchService.shared.searchApps(text: text) { (apps, error) in
            if let apps = apps {
                DispatchQueue.main.async {
                    self.apps = apps
                    self.tableView.reloadData()
                }
            }
        }
    }
}

extension SearchViewController{
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return .init(tableView.bounds.width * 0.8)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.apps.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! SearchCell
        cell.app = self.apps[indexPath.item]
        return cell
    }
    
}
