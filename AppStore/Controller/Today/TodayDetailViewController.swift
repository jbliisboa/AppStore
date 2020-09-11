//
//  TodayDetailViewController.swift
//  AppStore
//
//  Created by Admin on 03/06/20.
//  Copyright © 2020 João Lisboa. All rights reserved.
//

import UIKit

class TodayDetailViewController: UIViewController {
    
    var todayApp: TodayApp? {
        
        didSet {
            
            if let todayApp = todayApp {
                
                if todayApp.apps == nil {
                    self.addSingle()
                } else {
                    self.addMultiplo()
                }
            }
        }
    }
    
    let buttonClose: UIButton = .buttonClose()
    
    var centerView: UIView?
    var frame: CGRect?
    
    var topConstraint: NSLayoutConstraint?
    var leadingConstraint: NSLayoutConstraint?
    var widthConstraint: NSLayoutConstraint?
    var heigthConstraint: NSLayoutConstraint?
    
    let todaySingleDetail = TodaySingleDetail()
    let todayDetailMultiploViewController = TodayDetailMultiploViewController()
    
    var handlerClose: (() -> ())?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        view.backgroundColor = .clear
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = false
    }
    
    func addButtonClose () {
        view.addSubview(buttonClose)
        
        buttonClose.alpha = 0
        buttonClose.addTarget(self, action: #selector(handleCloseClick), for: .touchUpInside)
        buttonClose.fill(top: self.view.safeAreaLayoutGuide.topAnchor, leading: nil, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 18, left: 0, bottom: 0, right: 24), size: .init(width: 32, height: 32))
        
        UIView.animate(withDuration: 0.3, delay: 0.2, options: .showHideTransitionViews, animations: {
            self.buttonClose.alpha = 1
        }, completion: nil)
        
    }
    
    func addSingle () {
        
        todaySingleDetail.todayApp = self.todayApp
        self.centerView = todaySingleDetail.view
        self.animation()
        
    }
    
    func addMultiplo () {
        todayDetailMultiploViewController.todayApp = self.todayApp
        todayDetailMultiploViewController.handlerClique = { app in
            
            let detailViewController = AppDetailViewController()
            detailViewController.title = app.nome
            detailViewController.appId = app.id
            detailViewController.app = app
            
            self.navigationController?.pushViewController(detailViewController, animated: true)
            
            
        }
        self.centerView = todayDetailMultiploViewController.view
        self.animation()
    }
    
    func animation () {
        guard let centerView = self.centerView else {return}
        guard let frame = self.frame else {return}
        
        centerView.translatesAutoresizingMaskIntoConstraints = false
        centerView.layer.cornerRadius = 16
        centerView.clipsToBounds = true
        
        view.addSubview(centerView)
        
        self.addButtonClose()
        
        
        self.topConstraint = centerView.topAnchor.constraint(equalTo: view.topAnchor, constant: frame.origin.y)
        self.leadingConstraint = centerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: frame.origin.x)
        self.widthConstraint = centerView.widthAnchor.constraint(equalToConstant: frame.width)
        self.heigthConstraint = centerView.heightAnchor.constraint(equalToConstant: frame.height)
        
        self.topConstraint?.isActive = true
        self.leadingConstraint?.isActive = true
        self.widthConstraint?.isActive = true
        self.heigthConstraint?.isActive = true
        
        view.layoutIfNeeded()
        
        UIView.animate(withDuration: 0.6, delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: .overrideInheritedCurve, animations: {
            
            self.topConstraint?.constant = 0
            self.leadingConstraint?.constant = 0
            self.widthConstraint?.constant = self.view.frame.width
            self.heigthConstraint?.constant = self.view.frame.height
            
            self.centerView?.layer.cornerRadius = 0
            
            self.view.layoutIfNeeded()
            
        }, completion: nil)
    }
    
    func animationClose () {
        
        self.todayDetailMultiploViewController.tableView.setContentOffset(CGPoint(x: 0, y: -self.todayDetailMultiploViewController.tableView.safeAreaInsets.top), animated: false)
        self.todayDetailMultiploViewController.tableView.layoutIfNeeded()
        
        UIView.animate(withDuration: 0.6, delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: .overrideInheritedCurve, animations: {
            
            if let frame = self.frame {
                self.topConstraint?.constant = frame.origin.y
                self.leadingConstraint?.constant = frame.origin.x
                self.widthConstraint?.constant = frame.width
                self.heigthConstraint?.constant = frame.height
                
                self.centerView?.layer.cornerRadius = 16
                
                self.todaySingleDetail.tableView.contentOffset = .zero
                
                self.view.layoutIfNeeded()
            }
            
        }) {(_) in
            
            self.dismiss(animated: false, completion: nil)
            
        }
    }
    
    @objc func handleCloseClick () {
        self.buttonClose.isHidden = true
        self.handlerClose?()
        self.animationClose()
        
        
    }
    
}
