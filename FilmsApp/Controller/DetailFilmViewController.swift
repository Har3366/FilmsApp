//
//  DetailFilmViewController.swift
//  FilmsApp
//
//  Created by Игорь on 15.12.2021.
//

import UIKit

class DetailFilmViewController: UIViewController, UIViewControllerTransitioningDelegate {
    
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var filmTitleLabel: UILabel!
    @IBOutlet weak var releaseYearLabel: UILabel!
    @IBOutlet weak var galleryCollection: UICollectionView!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    var model = Model()
    
    static let storyboardID = "DetailFilmViewControllerS"
    var receivedIndex: Int = 0
    
    var transition: RoundingTransition = RoundingTransition()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        posterImageView.image = UIImage(named: model.testArray[receivedIndex].testPic ?? "image1")
        filmTitleLabel.text = model.testArray[receivedIndex].testTitle
        releaseYearLabel.text = String(model.testArray[receivedIndex].testYear ?? 1900)
        ratingLabel.text = String(model.testArray[receivedIndex].testRating ?? 0)
    
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destinationVC = segue.destination as? PosterFullViewController else {return}
        destinationVC.detailIndexPath = receivedIndex
        
        destinationVC.transitioningDelegate = self
        destinationVC.modalPresentationStyle = .custom
    }
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.transitionProfile = .show
        transition.start = posterImageView.center
        transition.circleColor = #colorLiteral(red: 1, green: 0.7799600959, blue: 0, alpha: 1)
        
        return transition
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.transitionProfile = .cancel
        transition.start = posterImageView.center
        transition.circleColor = #colorLiteral(red: 1, green: 0.7799600959, blue: 0, alpha: 1)
        
        return transition
    }
    @IBAction func tapGestureAction(_ sender: UITapGestureRecognizer) {
    }
    
}
