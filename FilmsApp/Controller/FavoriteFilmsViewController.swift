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
    
    // создание экземпляра модели не из RealmDB
    var model = Model()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //вызов функции по добавлению фильмов с отметкой isLiked = true в массив likedFilmsArray.  RealmDB не используется
        model.likedFilms()
        let xibLikedFilmCell = UINib(nibName: LikedFilmCell.identifier, bundle: nil)
        likedFilmsCollectionView.register(xibLikedFilmCell, forCellWithReuseIdentifier: LikedFilmCell.identifier)
        likedFilmsCollectionView.reloadData()
        
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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let destVC = storyboard?.instantiateViewController(withIdentifier: DetailFilmViewController.storyboardID) as? DetailFilmViewController else {
            return
        }
        destVC.receivedIndex = model.likedFilmsArray[indexPath.row].id ?? 0
        //present(destVC, animated: true)
        navigationController?.pushViewController(destVC, animated: true)
    }
    
}

