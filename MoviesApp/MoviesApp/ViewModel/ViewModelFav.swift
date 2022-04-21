//
//  ViewModelFav.swift
//  MoviesApp
//
//  Created by Raul Bautista on 19/4/22.
//

import Foundation


class ViewModelFav {
    
    var movieList: [Movies] = []
    var updateList: (() ->Void)?
    let persistenceManager: PersistenceManager
    
    init(persistenceManager: PersistenceManager = PlistPersistenceManager()) {
        self.persistenceManager = persistenceManager
    }
    
    func loadFav(){
        let moviesFromPlist: [Movies] = persistenceManager.read()
        movieList = moviesFromPlist
        updateList?()
    }
    
}
