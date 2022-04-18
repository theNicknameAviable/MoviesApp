//
//  ViewModel.swift
//  MoviesApp
//
//  Created by Raul Bautista on 18/4/22.
//

import Foundation


class SceneViewModel {
    
    let movieList: [Movies] = []
    let netowrker: NetworkWorker
    let movie: String? = ""
    
    init (networker: NetworkWorker = NetworkWorker()){
        self.netowrker = networker
    }
    
    func fetchInfo() {
        
    }
    
}
