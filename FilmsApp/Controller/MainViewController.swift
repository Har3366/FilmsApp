//
//  ViewController.swift
//  FilmsApp
//
//  Created by Игорь on 15.12.2021.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var mainCollectionView: UICollectionView!
   
    @IBOutlet weak var sortingBtn: UIBarButtonItem!
    @IBAction func sortingBtnPressed(_ sender: UIBarButtonItem) {
        let arrowUp = UIImage(systemName: "arrow.up")
        let arrowDown = UIImage(systemName: "arrow.down")
        model.sorted.toggle()
        sortingBtn.image = model.sorted ? arrowUp : arrowDown
        model.sorting()
        mainCollectionView.reloadData()
    }
    
    var model = Model()
    
    var searchController = UISearchController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        model.sortedTestArray = model.testArray
        
        let xibCell = UINib(nibName: FilmCell.identifier, bundle: nil)
        mainCollectionView.register(xibCell, forCellWithReuseIdentifier: FilmCell.identifier)
        
        mainCollectionView.delegate = self
        mainCollectionView.dataSource = self
        mainCollectionView.reloadData()
        
        searchController.searchBar.delegate = self
        searchController.searchBar.placeholder = "Поиск фильма..."
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        
    
        
    }

 

}

extension MainViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return model.sortedTestArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = mainCollectionView.dequeueReusableCell(withReuseIdentifier: FilmCell.identifier, for: indexPath) as?
                FilmCell else {
                    return UICollectionViewCell()
                }
        cell.data = self.model.sortedTestArray[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let destinationVC = storyboard?.instantiateViewController(withIdentifier: DetailFilmViewController.storyboardID) as? DetailFilmViewController
        else {return}
        destinationVC.receivedIndex = model.sortedTestArray[indexPath.row].id ?? 0
        present(destinationVC, animated: true)
    }
    
    
}

extension MainViewController: UICollectionViewDelegate {
    
}

extension MainViewController: UISearchBarDelegate {
    
}
