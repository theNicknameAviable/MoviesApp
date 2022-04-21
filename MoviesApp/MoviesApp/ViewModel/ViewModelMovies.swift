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
        favList = persistenceManager.read()
    }
    
    func fetchMovies() {
        networker.request { movieList in
            self.movieList = movieList
            self.updateList?()
        }
    }
    
    func checkIsFAv(for row: Int) -> String {
        let movieList = movieList[row]
        if favList.contains(where: {movieList.title == $0.title}) {
            return "star.fill"
        } else {
            return "star"
        }
    }
    
    func switchFavMovie(for row: Int) {
        let movieList = movieList[row]
        if favList.contains(where: {movieList.title == $0.title}) {
            deleteFavMovie(movieList)
        } else {
            saveFavMovie(movieList)
        }
    }
    
    func saveFavMovie(_ movie: Movies){
        favList.append(movie)
        updateList?()
    }
    
    func deleteFavMovie(_ movie: Movies){
        if let index = favList.firstIndex(where: {movie.title == $0.title}){
            favList.remove(at: index)
        }
        saveFavorite()
        updateList?()
    }
    
    func saveFavorite() {
        let result = persistenceManager.save(objet: favList)
        if !result {
            print("error")
        }
    }
}
