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
    let refreshControl = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let xibLikedFilmCell = UINib(nibName: LikedFilmCell.identifier, bundle: nil)
        likedFilmsCollectionView.register(xibLikedFilmCell, forCellWithReuseIdentifier: LikedFilmCell.identifier)
        likedBarItem.badgeValue = String(model.likedFilmObjects?.count ?? 0)
        DispatchQueue.main.async {
            self.likedFilmsCollectionView.reloadData()
        }
        
        
        refreshControl.addTarget(self, action: #selector(needToRefresh), for: .valueChanged)
        likedFilmsCollectionView.alwaysBounceVertical = true
        likedFilmsCollectionView.refreshControl = refreshControl
        
       
        
    }
    @objc func needToRefresh(){
        
        likedBarItem.badgeValue = String(model.likedFilmObjects?.count ?? 0)
        likedFilmsCollectionView.reloadData()
        refreshControl.endRefreshing()
    }
}

extension FavoriteFilmsViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return model.likedFilmObjects?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = likedFilmsCollectionView.dequeueReusableCell(withReuseIdentifier: LikedFilmCell.identifier, for: indexPath) as? LikedFilmCell,
              let likedItem = model.likedFilmObjects?[indexPath.item]
        else {
            return UICollectionViewCell()
        }
        cell.data = likedItem
        
           return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let destVC = storyboard?.instantiateViewController(withIdentifier: DetailFilmViewController.storyboardID) as? DetailFilmViewController else {
            return
        }
        destVC.receivedIndex = model.likedFilmObjects?[indexPath.row].id ?? 0
        navigationController?.pushViewController(destVC, animated: true)
    }
    
}

