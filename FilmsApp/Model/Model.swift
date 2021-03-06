//
//  Model.swift
//  FilmsApp
//
//  Created by Игорь on 12.02.2022.
//

import Foundation

class Model {
    var testArray:[Item] = [
        Item(id:0,testPic: "image1", testTitle: "Длинное название фильма", testYear: 2001, testRating: 1,isLiked: true),
        Item(id:1,testPic: "image2", testTitle: "Очень длинное название фильма", testYear: 2002, testRating: 12,isLiked: true),
        Item(id:2,testPic: "image3", testTitle: "Самое наидлиннющее наименование кинокартины", testYear: 2003, testRating: 3,isLiked: false),
        Item(id:3,testPic: "image4", testTitle: "Фильм4", testYear: 2004, testRating: 5,isLiked: false),
        Item(id:4,testPic: "image5", testTitle: "Фильм5", testYear: 2005, testRating: 6,isLiked: false),
        Item(id:5,testPic: "image6", testTitle: "Фильм6", testYear: 2006, testRating: 7,isLiked: false),
        Item(id:6,testPic: "image7", testTitle: "Фильм7", testYear: 2007, testRating: 18,isLiked: true),
        Item(id:7,testPic: "image8", testTitle: "Фильм8", testYear: 2008, testRating: 9,isLiked: false),
        Item(id:8,testPic: "image9", testTitle: "Фильм9", testYear: 2009, testRating: 111,isLiked: false),
        Item(id:9,testPic: "image10", testTitle: "Фильм10", testYear: 2010, testRating: 23,isLiked: false),
        Item(id:10,testPic: "image11", testTitle: "Фильм11", testYear: 2011, testRating: 45,isLiked: false),
        Item(id:11,testPic: "image12", testTitle: "Фильм12", testYear: 2012, testRating: 31,isLiked: false),
        Item(id:12,testPic: "image13", testTitle: "Фильм13", testYear: 2013, testRating: 99,isLiked: false),
        Item(id:13,testPic: "image14", testTitle: "Фильм14", testYear: 2014, testRating: 101,isLiked: false),
        Item(id:14,testPic: "image15", testTitle: "Фильм15", testYear: 2015, testRating: 18,isLiked: false)
    ]
    var likedFilmsArray = [Item]()
    func likedFilms() {
        for i in testArray {
            if i.isLiked {
                self.likedFilmsArray.append(i)
            }
        }
    }
    
    var sortedTestArray = [Item]()
    var sorted = false
    func sorting() {
        self.testArray.sort {
            sorted ? ( $0.testRating ?? 0 < $1.testRating ?? 0) : ( $0.testRating ?? 0 > $1.testRating ?? 0)
        }
        sortedTestArray = testArray
    }
    
    func search(searchTextValue: String) {
        sortedTestArray = []
        if searchTextValue == "" {
            sortedTestArray = testArray
        } else {
            for item in testArray {
                guard let unwrItem = item.testTitle else {
                    return
                }
                if unwrItem.contains(searchTextValue) {
                    sortedTestArray.append(item)
                }
            }
        }
        sortedTestArray = testArray.filter({
            $0.testTitle?.range(of: searchTextValue,options: .caseInsensitive) != nil
        })
    }
}

class Item {
    var id: Int?
    var testPic: String?
    var testTitle: String?
    var testYear: Int?
    var testRating: Double?
    var isLiked: Bool
    
    init(id: Int?, testPic: String?, testTitle: String?, testYear: Int?, testRating: Double?, isLiked: Bool){
        self.id = id
        self.testPic = testPic
        self.testTitle = testTitle
        self.testYear = testYear
        self.testRating = testRating
        self.isLiked = isLiked
    }
}
