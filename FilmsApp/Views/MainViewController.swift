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
    
    var testArray:[TestModel] = [
    TestModel(testPic: "image1", testTitle: "Фильм1", testYear: "2001", testRating: "1"),
    TestModel(testPic: "image2", testTitle: "Фильм2", testYear: "2002", testRating: "12"),
    TestModel(testPic: "image3", testTitle: "Фильм3", testYear: "2003", testRating: "3"),
    TestModel(testPic: "image4", testTitle: "Фильм4", testYear: "2004", testRating: "5"),
    TestModel(testPic: "image5", testTitle: "Фильм5", testYear: "2005", testRating: "6"),
    TestModel(testPic: "image6", testTitle: "Фильм6", testYear: "2006", testRating: "7"),
    TestModel(testPic: "image7", testTitle: "Фильм7", testYear: "2007", testRating: "18"),
    TestModel(testPic: "image8", testTitle: "Фильм8", testYear: "2008", testRating: "09"),
    TestModel(testPic: "image9", testTitle: "Фильм9", testYear: "2009", testRating: "111"),
    TestModel(testPic: "image10", testTitle: "Фильм10", testYear: "2010", testRating: "23"),
    TestModel(testPic: "image11", testTitle: "Фильм11", testYear: "2011", testRating: "45"),
    TestModel(testPic: "image12", testTitle: "Фильм12", testYear: "2012", testRating: "31"),
    TestModel(testPic: "image13", testTitle: "Фильм13", testYear: "2013", testRating: "0990"),
    TestModel(testPic: "image14", testTitle: "Фильм14", testYear: "2014", testRating: "101"),
    TestModel(testPic: "image15", testTitle: "Фильм15", testYear: "2015", testRating: "18")
    ]
    
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
    
    
}

extension MainViewController: UICollectionViewDelegate {
    
}

extension MainViewController: UISearchBarDelegate {
    
}
