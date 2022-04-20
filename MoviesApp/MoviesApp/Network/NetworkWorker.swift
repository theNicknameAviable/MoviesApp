//
//  NetworkWorker.swift
//  MoviesApp
//
//  Created by Raul Bautista on 18/4/22.
//

import Foundation
import Alamofire


class NetworkWorker {
    
    static let apiKey = "cd342d8312c81508538c19fdf63cc308"
    
    func request(completionBlock: @escaping (([Movies]) -> Void)) {
        let url = "https://api.themoviedb.org/3/movie/popular?api_key=\(NetworkWorker.apiKey)&language=en-US&page=1"
        AF.request(url).responseDecodable(of: MoviesResponse.self) { response in
            let movies = try? response.result.get().results
            completionBlock(movies ?? [])
        }
    }
    
    struct MoviesResponse: Decodable {
        let page: Int
        let results: [Movies]
    }
    
}
