//
//  BaseTabBArViewController.swift
//  AppStore
//
//  Created by Admin on 25/05/20.
//  Copyright © 2020 João Lisboa. All rights reserved.
//

import UIKit

class BaseTabBArViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let todayVC = self.creatTabItem(viewController: TodayViewController(), title: "Hoje", image: "icone-hoje")
        
        let appsVC = self.creatTabItem(viewController: AppsViewController(), title: "Apps", image: "icone-apps")
        
        let searchVC = self.creatTabItem(viewController: SearchViewController(), title: "Busca", image: "icone-busca")
        
        viewControllers = [todayVC, appsVC, searchVC]
        
        selectedIndex = 0
    
    }
    
    func creatTabItem (viewController: UIViewController, title: String, image: String) -> UIViewController{
        
        let navController = UINavigationController(rootViewController: viewController)
        
        navController.navigationBar.prefersLargeTitles = true
        
        viewController.navigationItem.title = title
        viewController.tabBarItem.title = title
        viewController.tabBarItem.image = UIImage(named: image)
        viewController.view.backgroundColor = .white
        
        return navController
        
    }
    
}
