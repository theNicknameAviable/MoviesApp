//
//  ViewController.swift
//  MoviesApp
//
//  Created by Raul Bautista on 18/4/22.
//

import UIKit

class ViewControllerMovies: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var movieTable: UITableView!

    
    let viewModel = ViewModelMovies()

    override func viewDidLoad() {
        super.viewDidLoad()
        movieTable.estimatedRowHeight = 80
        movieTable.dataSource = self
        movieTable.delegate = self
        registerTableViewCells()
        viewModel.updateList = {
            self.movieTable.reloadData()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewModel.loadFav()
    }


}
// MARK: - Table Controller
extension ViewControllerMovies {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.movieList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as? MovieCell
        cell?.film.text = "Movie: \(viewModel.movieList[indexPath.row].name)"
        cell?.favImage.image = UIImage (systemName: viewModel.checkIsFAv(for: indexPath.row))

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
        //viewModel.loadFav(for: indexPath.row)
    }
    
}
