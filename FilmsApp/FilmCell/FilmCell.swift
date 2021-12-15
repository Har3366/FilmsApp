//
//  CollectionViewCell.swift
//  FilmsApp
//
//  Created by Игорь on 15.12.2021.
//

import UIKit

class FilmCell: UICollectionViewCell {
    static let identifier = "FilmCell"
    
    @IBOutlet weak var posterPreviewImageView: UIImageView!
    @IBOutlet weak var filmTitleLabel: UILabel!
    @IBOutlet weak var releaseYearLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
}
