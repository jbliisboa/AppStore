//
//  App.swift
//  AppStore
//
//  Created by Admin on 28/05/20.
//  Copyright © 2020 João Lisboa. All rights reserved.
//

import UIKit

struct App: Decodable{
    
    let id: Int
    let nome: String
    let empresa:String
    let avaliacao:String?
    let iconeUrl:String
    let descricao:String?
    let screenshotUrls: [String]?
    let comentarios: [AppComentario]?
    
}

struct AppsFeatured: Decodable{
    
    let id: Int
    let nome: String
    let empresa: String
    let imagemUrl: String
    let descricao: String
    
}

struct AppGroup:Decodable {
    let id: String
    let titulo: String
    let apps: [App]
}

struct AppComentario: Decodable {
    let id: Int
    let titulo: String
    let avaliacao: Int
    let descricao: String?
}
