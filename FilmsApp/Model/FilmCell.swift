//
//  CollectionViewCell.swift
//  FilmsApp
//
//  Created by Игорь on 15.12.2021.
//

import UIKit

class FilmCell: UICollectionViewCell {
    static let identifier = "FilmCell"
    let urlService = URLService()
    let address = "https://image.tmdb.org/t/p/w500"
    
    @IBOutlet weak var posterPreviewImageView: UIImageView!
    @IBOutlet weak var filmTitleLabel: UILabel!
    @IBOutlet weak var releaseYearLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    
    var data: FilmObject? {
        didSet {
            guard let unwrData = data, let url = URL(string: address + unwrData.filmPic) else {
                return
            }
            urlService.postersSetUp(with: url, imageView: posterPreviewImageView)
            filmTitleLabel.text = unwrData.filmTitle
            releaseYearLabel.text = String(unwrData.filmYear)
            ratingLabel.text = String(unwrData.filmRating)
        }
    }
}
