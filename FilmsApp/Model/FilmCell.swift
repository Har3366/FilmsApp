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
    
    var data: FilmObject? {
        didSet {
            guard data != nil else {
                return
            }
            posterPreviewImageView.image = UIImage(named: data?.filmPic ?? "image0")
            filmTitleLabel.text = data?.filmTitle
            releaseYearLabel.text = String(data?.filmYear ?? 0)
            ratingLabel.text = String(data?.filmRating ?? 0)
        }
    }
}
