
//
//  AppService.swift
//  AppStore
//
//  Created by Admin on 31/05/20.
//  Copyright © 2020 João Lisboa. All rights reserved.
//

import UIKit

class AppService {
    
    static let shared = AppService()
    
    let API = "https://api.euprogramador.app/app-store/v1"
    
    func searchAppsFeatured (completion: @escaping ([AppsFeatured]?, Error?) -> ()) {
        
        guard let url = URL (string: "\(API)/apps/apps-em-destaque") else {return}
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completion(nil, error)
                return
            }
            
            do {
                guard let data = data else {return}
                let apps = try JSONDecoder().decode([AppsFeatured].self, from: data)
                completion(apps, nil)
            } catch let error {
                completion(nil, error)
                return
            }
        }.resume()
    }
    
    func searchGroup (type: String, completion: @escaping(AppGroup?, Error?) -> ()) {
        
        guard let url = URL (string: "\(API)/apps/\(type)") else {return}
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completion(nil, error)
                return
            }
            
            do {
                guard let data = data else {return}
                let apps = try JSONDecoder().decode(AppGroup.self, from: data)
                completion(apps, nil)
            } catch let error {
                completion(nil, error)
                return
            }
        }.resume()
        
    }
    
    func searchAppId (appId: Int, completion: @escaping (App?, Error?) -> ()) {
        guard let url = URL(string: "\(API)/apps/\(appId)") else {return}
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completion(nil, error)
                return
            }
            
            do {
                guard let data = data else {return}
                let app = try JSONDecoder().decode(App.self, from: data)
                completion(app, nil)
            } catch let error {
                completion(nil, error)
                return
            }
        }.resume()
    }
    
    func searchApps (completion: @escaping ([App]?, Error?) -> ()) {
        guard let url = URL(string: "\(API)/apps") else {return}
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completion(nil, error)
                return
            }
            
            do {
                guard let data = data else {return}
                let apps = try JSONDecoder().decode([App].self, from: data)
                completion(apps, nil)
            } catch let error {
                completion(nil, error)
                return
            }
        }.resume()
    }
    
}
