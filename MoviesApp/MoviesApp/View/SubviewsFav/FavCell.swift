//
//  FavCell.swift
//  MoviesApp
//
//  Created by Raul Bautista on 19/4/22.
//

import UIKit

class FavCell: UITableViewCell {
  
    @IBOutlet weak var favFilm: UILabel!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureView()
    }
    
    func configureView() {
        backgroundColor = .white
    }
}
