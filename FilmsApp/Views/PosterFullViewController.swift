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
    
    var detailIndexPath = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fullPosterImageView.image = UIImage(named: testArray[detailIndexPath].testPic ?? "image1")
    }
    
    @IBAction func closeButtonPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
