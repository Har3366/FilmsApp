//
//  ViewController.swift
//  FilmsApp
//
//  Created by Игорь on 15.12.2021.
//

import UIKit
import RealmSwift

class MainViewController: UIViewController {

    @IBOutlet weak var mainCollectionView: UICollectionView!
    @IBOutlet weak var sortingBtn: UIBarButtonItem!
    
    @IBAction func sortingBtnPressed(_ sender: UIBarButtonItem) {
        let arrowUp = UIImage(systemName: "arrow.up")
        let arrowDown = UIImage(systemName: "arrow.down")
        model.sorted.toggle()
        sortingBtn.image = model.sorted ? arrowUp : arrowDown
        model.sorting()
        DispatchQueue.main.async {
            self.mainCollectionView.reloadData()
        }
        
    }
    // создание экземпляра модели не из RealmDB
    let model = Model()
    let service = URLService()
    var searchController = UISearchController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        model.sorting()
        model.showLikedFilms()
        
        let xibCell = UINib(nibName: FilmCell.identifier, bundle: nil)
        mainCollectionView.register(xibCell, forCellWithReuseIdentifier: FilmCell.identifier)
        mainCollectionView.delegate = self
        mainCollectionView.dataSource = self
        DispatchQueue.main.async {
            self.service.dataRequest()
        }
        mainCollectionView.reloadData()
        searchController.searchBar.delegate = self
        searchController.searchBar.placeholder = "Поиск фильма..."
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        
        tabBarController?.tabBar.items?[1].badgeValue = String(model.likedFilmObjects?.count ?? 0)
        
        service.dataRequest()
    }
        
}

extension MainViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return model.filmObjects?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = mainCollectionView.dequeueReusableCell(withReuseIdentifier: FilmCell.identifier, for: indexPath) as?
                FilmCell,
              let item = model.filmObjects?[indexPath.row]
        else {
            return UICollectionViewCell()
        }
        cell.data = item
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let destinationVC = storyboard?.instantiateViewController(withIdentifier: DetailFilmViewController.storyboardID) as? DetailFilmViewController
        else {return}
        destinationVC.receivedIndex = indexPath.row
        navigationController?.pushViewController(destinationVC, animated: true)
    }
    
    
}

extension MainViewController: UICollectionViewDelegate {

}

extension MainViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        model.arrayHelper = model.filmObjects
        model.search(searchTextValue: searchText)
        if searchBar.text?.count == 0 {
            model.arrayHelper = model.filmObjects
            model.sorting()
        }
        mainCollectionView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        model.arrayHelper = model.filmObjects
        if searchBar.text?.count == 0 {
            model.arrayHelper = model.filmObjects
            model.sorting()
        }
        model.sorting()
        
        DispatchQueue.main.async {
            self.mainCollectionView.reloadData()
        }
    }
}
