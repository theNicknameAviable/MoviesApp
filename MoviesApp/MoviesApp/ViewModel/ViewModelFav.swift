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
    
    func loadFav(){
        movieList = []
        updateList?()
    }
    
}
