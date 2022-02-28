//
//  PosterFullViewController.swift
//  FilmsApp
//
//  Created by Игорь on 11.01.2022.
//

import UIKit

class PosterFullViewController: UIViewController {

    @IBOutlet weak var fullPosterImageView: UIImageView!
    @IBOutlet weak var closeButton: UIButton!
    var model = Model()
    var detailIndexPath = 0
    let service = URLService()
    let address = "https://image.tmdb.org/t/p/original"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let unwrFilmPic = self.model.filmObjects?[self.detailIndexPath].filmPic,
              let posterURL = URL(string: self.address + unwrFilmPic) else {return}
        service.postersSetUp(with: posterURL, imageView: fullPosterImageView)
    }
    
    @IBAction func closeButtonPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
