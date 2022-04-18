//
//  MovieCell.swift
//  MoviesApp
//
//  Created by Raul Bautista on 18/4/22.
//

import UIKit

class MovieCell: UITableViewCell {
  
    @IBOutlet weak var film: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureView()
    }
    
    func configureView() {
        //character.textColor = .darkGray
        backgroundColor = .white
    }
}
