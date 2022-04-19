//
//  ViewModel.swift
//  MoviesApp
//
//  Created by Raul Bautista on 18/4/22.
//

import Foundation


class ViewModelMovies {
    
    var movieList: [Movies] = []
    let networker: NetworkWorker
    var updateList: (() ->Void)?
    
    init (networker: NetworkWorker = NetworkWorker()){
        self.networker = networker
    }
    
    func fetchMovies() {

        }
}
