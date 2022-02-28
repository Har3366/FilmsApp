//
//  LikedFilmCell.swift
//  FilmsApp
//
//  Created by Игорь on 12.02.2022.
//

import UIKit

class LikedFilmCell: UICollectionViewCell {

    static let identifier = "LikedFilmCell"
    
    @IBOutlet weak var posterPreviewImageView: UIImageView!
    @IBOutlet weak var filmTitleLabel: UILabel!
    @IBOutlet weak var releaseYearLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    
    var model = Model()
    let urlService = URLService()
    let address = "https://image.tmdb.org/t/p/w500"
    
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
    
    @IBAction func unlikeBtnPressed(_ sender: UIButton) {
        guard let likedData = data else {
            return
        }
        model.updateLike(at: likedData.id)
        if alpha == 0.55 {
            alpha = 1
        } else if alpha == 1 {
            alpha = 0.55
        }
    }
}
