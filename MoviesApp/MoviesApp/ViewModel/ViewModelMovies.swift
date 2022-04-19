//
//  ViewModel.swift
//  MoviesApp
//
//  Created by Raul Bautista on 18/4/22.
//

import Foundation


class SceneViewModel {
    
    var movieList: [Movies] = []
    let networker: NetworkWorker
    var updateList: (() ->Void)?
    
    init (networker: NetworkWorker = NetworkWorker()){
        self.networker = networker
    }
    
    func fetchMovies() {
        networker.requet  { movieList in
            self.movieList = movieList
            updateList?()
        }
        
    }
    
}
