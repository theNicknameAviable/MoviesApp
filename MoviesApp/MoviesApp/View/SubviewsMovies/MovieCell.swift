//
//  MovieCell.swift
//  MoviesApp
//
//  Created by Raul Bautista on 18/4/22.
//

import UIKit

class MovieCell: UITableViewCell {
  
    @IBOutlet weak var film: UILabel!
    @IBOutlet weak var favImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureView()
    }
    
    func configureView() {
        backgroundColor = .white
    }
}
