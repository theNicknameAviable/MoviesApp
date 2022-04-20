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
    
    func initialLoad(){
        loadFav()
        fetchMovies()
    }
    
    func loadFav(){
        favList = []
    }
    
    func fetchMovies() {
        networker.request { movieList in
            self.movieList = movieList
            self.updateList?()
        }
    }
    
    func checkIsFAv(for row: Int) -> String {
        let movieList = movieList[row]
        if favList.contains(where: {movieList.name == $0.name}) {
            return "star.fill"
        } else {
            return "star"
        }
    }
    
    func switchFavMovie(for row: Int) {
        let movieList = movieList[row]
        if favList.contains(where: {movieList.name == $0.name}) {
            deleteFavMovie(movieList)
        } else {
            saveFavMovie(movieList)
        }
    }
    
    func saveFavMovie(_ movie: Movies){
        
        
    }
    
    func deleteFavMovie(_ movie: Movies){
        
        
    }
}
