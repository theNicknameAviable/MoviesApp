//
//  ViewControllerFav.swift
//  MoviesApp
//
//  Created by Raul Bautista on 19/4/22.
//

import UIKit

class ViewControllerFav: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var favTable: UITableView!
    
    let viewModel = ViewModelFav()

    override func viewDidLoad() {
        super.viewDidLoad()
        favTable.estimatedRowHeight = 80
        favTable.dataSource = self
        favTable.delegate = self
        registerTableViewCells()
        viewModel.loadFav()
    }


}
// MARK: - Table Controller
extension ViewControllerFav {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.movieList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FavCell", for: indexPath) as? FavCell
        cell?.favFilm.text = "Favorite: \(viewModel.movieList[indexPath.row].title)"

        if let safeCell = cell {
            return safeCell
        }
        return UITableViewCell()
    }
    
    func registerTableViewCells() {
        let textFieldCell = UINib(nibName: "FavCell", bundle: nil)
        favTable.register(textFieldCell, forCellReuseIdentifier: "FavCell")
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return NSLocalizedString("Favorite", comment: "")
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        //let item = viewModel.movieList[indexPath.row]
    }
    
}
