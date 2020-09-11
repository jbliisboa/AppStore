//
//  SearchService.swift
//  AppStore
//
//  Created by Admin on 26/05/20.
//  Copyright © 2020 João Lisboa. All rights reserved.
//

import UIKit

class SearchService{
    
    static let shared = SearchService()
    
    func searchApps (text: String, completion: @escaping([App]?, Error?) -> ()) {
        
        guard let url = URL(string: "https://api.euprogramador.app/app-store/v1/apps?search=\(text)") else{return}
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let error = error {
                completion (nil, error)
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
