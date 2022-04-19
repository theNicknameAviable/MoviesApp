//
//  ViewController.swift
//  MoviesApp
//
//  Created by Raul Bautista on 18/4/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var movieTable: UITableView!
    @IBOutlet weak var favTable: UITableView!
    
    let viewModel = SceneViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        movieTable.estimatedRowHeight = 90
        movieTable.dataSource = self
        movieTable.delegate = self
        favTable.estimatedRowHeight = 90
        favTable.dataSource = self
        favTable.delegate = self
        registerTableViewCells()
        viewModel.fetchInfo()
    }


}
// MARK: - Table Controller
extension ViewController {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.movieList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as? MovieCell
        cell?.film.text = "Movie: \(viewModel.movieList[indexPath.row].name)"

        if let safeCell = cell {
            return safeCell
        }
        return UITableViewCell()
    }
    
    func registerTableViewCells() {
        let textFieldCell = UINib(nibName: "MovieCell", bundle: nil)
        movieTable.register(textFieldCell, forCellReuseIdentifier: "MovieCell")
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return NSLocalizedString("Movie", comment: "")
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let item = viewModel.movieList[indexPath.row]
        showMovieName(response: item)
    }
    
}

//MARK: - Configuration View

extension ViewController {
    
    func showMovieName(response: Movies) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let detailViewController = storyboard.instantiateViewController(identifier: "ViewController") as? ViewController else { return }
        detailViewController.viewModel.movie = response.name
    }
}

