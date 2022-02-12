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
    
    var data: Item? {
        didSet {
            guard data != nil else {
                return
            }
            posterPreviewImageView.image = UIImage(named: data?.testPic ?? "image1")
            filmTitleLabel.text = data?.testTitle
            releaseYearLabel.text = String(data?.testYear ?? 0)
            ratingLabel.text = String(data?.testRating ?? 0)
        }
    }
}
