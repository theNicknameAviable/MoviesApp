//
//  ViewModel.swift
//  MoviesApp
//
//  Created by Raul Bautista on 18/4/22.
//

import Foundation


class ViewModelMovies {
    
    var movieList: [Movies] = []
    var favList: [Movies] = []
    let networker: NetworkWorker
    let persistenceManager: PersistenceManager
    var updateList: (() ->Void)?
    
    init (networker: NetworkWorker = NetworkWorker(), persistenceManager: PersistenceManager = PlistPersistenceManager()){
        self.networker = networker
        self.persistenceManager = persistenceManager
    }
    
    func fetchMovies() {

        }
}
