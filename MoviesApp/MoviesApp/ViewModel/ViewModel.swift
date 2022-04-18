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
    
    init (networker: NetworkWorker = NetworkWorker()){
        self.netowrker = networker
    }
    
    func showMovieName(response: Movies) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let detailViewController = storyboard.instantiateViewController(identifier: "ViewControllerCharacter") as? ViewControllerCharacter else { return }
        detailViewController.character = response.name
        detailViewController.infoCharacter = response.resultDescription
        present(detailViewController, animated: true, completion: nil)
    }
    
}
