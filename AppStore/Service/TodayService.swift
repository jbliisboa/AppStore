//
//  TodayService.swift
//  AppStore
//
//  Created by Admin on 04/06/20.
//  Copyright © 2020 João Lisboa. All rights reserved.
//

import UIKit

class TodayService {
    
    static let shared = TodayService()
    
    func searchTodayFeatured (completion: @escaping ([TodayApp]?, Error?) -> ()) {
        
        var todayApps: Array<TodayApp> = [
            
            TodayApp(id: 1, categoria: "TRAVEL", titulo: "Explore the world \nwithout fear", imagemUrl: "destaque-1", descricao: "Podemos vijar o mundo em busca da beleza, mas nunca a econtraremos se não a carregarmos dentro de nós.", backgroundColor: "#FFFFFF", apps: nil),
            
            TodayApp(id: 2, categoria: "PRATIQUE HOJE", titulo: "Matenha corpo \ne mente saudáveis", imagemUrl: "destaque-2", descricao: "Quanto mais se rema, maiores são as chances de pegar as melhores ondas, tanto no surf, quanto na vida.", backgroundColor: "#69CCE0", apps: nil)
            ]
        
        
        AppService.shared.searchApps { (apps, error) in
            
            if let apps = apps {
                todayApps.append(
                TodayApp(id: 3, categoria: "A LISTA DO DIA", titulo: "Pedale melhor com \nApp Watch", imagemUrl: nil, descricao: nil, backgroundColor: nil, apps: apps))
                
            }
            
            completion(todayApps, nil)
            
        }
        
    }
}
