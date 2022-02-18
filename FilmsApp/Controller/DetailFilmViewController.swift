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
    @IBOutlet weak var likeBtn: UIButton!
    
    
    var model = Model()
    
    static let storyboardID = "DetailFilmViewControllerS"
    var receivedIndex: Int = 0
    
    var transition: RoundingTransition = RoundingTransition()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.async {
            self.posterImageView.image = UIImage(named: self.model.filmObjects?[self.receivedIndex].filmPic ?? "image1")
            self.filmTitleLabel.text = self.model.filmObjects?[self.receivedIndex].filmTitle
            self.releaseYearLabel.text = String(self.model.filmObjects?[self.receivedIndex].filmYear ?? 1900)
            self.ratingLabel.text = String(self.model.filmObjects?[self.receivedIndex].filmRating ?? 0)
            
            if self.model.testArray[self.receivedIndex].isLiked {
                self.likeBtn.alpha = 1
                self.likeBtn.tintColor = .black
            } else {
                self.likeBtn.alpha = 0.2
                self.likeBtn.tintColor = .gray
            }
        }
        
    
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
    
    
    @IBAction func likeBtnAction(_ sender: UIButton) {
        model.updateLike(at: receivedIndex)
        
        if likeBtn.alpha == 1 {
            likeBtn.alpha = 0.45
            likeBtn.tintColor = .gray
        } else {
            likeBtn.alpha = 1
            likeBtn.tintColor = .black
        }
        
    }
    
    
    @IBAction func filmPicsBtnAction(_ sender: UIButton) {
    }
    
}

extension DetailFilmViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath)
        return cell
    }
    
    
}

extension DetailFilmViewController: UICollectionViewDelegate {
    
}
