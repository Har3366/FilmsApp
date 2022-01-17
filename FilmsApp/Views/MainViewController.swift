//
//  ViewController.swift
//  FilmsApp
//
//  Created by Игорь on 15.12.2021.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var mainCollectionView: UICollectionView!
    @IBOutlet weak var filmsSearchBar: UISearchBar!
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let xibCell = UINib(nibName: FilmCell.identifier, bundle: nil)
        mainCollectionView.register(xibCell, forCellWithReuseIdentifier: FilmCell.identifier)
        
        mainCollectionView.delegate = self
        mainCollectionView.dataSource = self
        
        filmsSearchBar.delegate = self
        
        mainCollectionView.reloadData()
        
    }


}

extension MainViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return testArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = mainCollectionView.dequeueReusableCell(withReuseIdentifier: FilmCell.identifier, for: indexPath) as?
                FilmCell else {
                    return UICollectionViewCell()
                }
        cell.posterPreviewImageView.image = UIImage(named: testArray[indexPath.row].testPic ?? "image1")
        cell.filmTitleLabel.text = testArray[indexPath.row].testTitle
        cell.releaseYearLabel.text = testArray[indexPath.row].testYear
        cell.ratingLabel.text = testArray[indexPath.row].testRating
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let destinationVC = storyboard?.instantiateViewController(withIdentifier: DetailFilmViewController.storyboardID) as? DetailFilmViewController
        else {return}
        destinationVC.receivedIndex = indexPath.row
        present(destinationVC, animated: true)
    }
    
    
}

extension MainViewController: UICollectionViewDelegate {
    
}

extension MainViewController: UISearchBarDelegate {
    
}
