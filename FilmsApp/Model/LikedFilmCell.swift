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
