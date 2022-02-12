//
//  FavoriteFilmsViewController.swift
//  FilmsApp
//
//  Created by Игорь on 15.12.2021.
//

import UIKit

class FavoriteFilmsViewController: UIViewController {

    @IBOutlet weak var likedFilmsCollectionView: UICollectionView!
    @IBOutlet weak var likedBarItem: UITabBarItem!
    
    var model = Model()
    override func viewDidLoad() {
        super.viewDidLoad()
       
        let xibLikedFilmCell = UINib(nibName: LikedFilmCell.identifier, bundle: nil)
        likedFilmsCollectionView.register(xibLikedFilmCell, forCellWithReuseIdentifier: LikedFilmCell.identifier)
        model.likedFilms
        likedBarItem.badgeValue = String(model.likedFilmsArray.count)
        likedFilmsCollectionView.reloadData()
        tabBarController?.reloadInputViews()
    }
    

}

extension FavoriteFilmsViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        model.likedFilmsArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = likedFilmsCollectionView.dequeueReusableCell(withReuseIdentifier: LikedFilmCell.identifier, for: indexPath) as? LikedFilmCell else {
            return UICollectionViewCell()
        }
        cell.data = self.model.likedFilmsArray[indexPath.item]
           return cell
        
    }
    
    
}

